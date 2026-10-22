from protocol import MAX_LINE, FrameReader, LineTooLong, encode


def test_message_split_byte_by_byte():
    r = FrameReader()
    data = encode({"type": "MSG", "text": "olá"})
    out = []
    for i in range(len(data)):
        out += r.feed(data[i:i + 1])
    assert out == [{"type": "MSG", "text": "olá"}]


def test_utf8_cut_in_the_middle_of_a_character():
    r = FrameReader()
    data = encode({"text": "ç"})
    cut = data.index("ç".encode()) + 1  # a meio dos 2 bytes de 'ç'
    assert r.feed(data[:cut]) == []
    assert r.feed(data[cut:]) == [{"text": "ç"}]


def test_several_messages_in_one_feed():
    r = FrameReader()
    data = encode({"a": 1}) + encode({"b": 2}) + b'{"c":'
    assert r.feed(data) == [{"a": 1}, {"b": 2}]
    assert r.feed(b"3}\n") == [{"c": 3}]


def test_empty_lines_are_ignored():
    assert FrameReader().feed(b"\n\r\n  \n") == []


def test_bad_json_and_non_object():
    out = FrameReader().feed(b"{bad\n[1,2]\n\xff\xfe\n" + encode({"ok": True}))
    assert [type(m) for m in out[:3]] == [ValueError] * 3
    assert out[3] == {"ok": True}


def test_line_too_long_without_newline():
    r = FrameReader()
    out = r.feed(b"x" * (MAX_LINE + 1))
    assert len(out) == 1 and isinstance(out[0], LineTooLong)


def test_line_too_long_with_newline_keeps_earlier_messages():
    out = FrameReader().feed(encode({"a": 1}) + b"x" * (MAX_LINE + 1) + b"\n")
    assert out[0] == {"a": 1}
    assert isinstance(out[1], LineTooLong)


def test_newline_inside_text_is_escaped():
    assert encode({"text": "a\nb"}).count(b"\n") == 1


# ---------- M6: frames binários ----------

from protocol import LENGTH, MAX_FRAME, FrameTooLarge  # noqa: E402


def chunk(data, tid="t1"):
    return encode({"type": "FILE_CHUNK", "id": tid, "data": data})


def test_chunk_wire_format():
    wire = chunk(b"\x00\n\xff")
    header, rest = wire.split(b"\n", 1)
    assert header == b'{"type": "FILE_CHUNK", "id": "t1"}'
    assert rest == LENGTH.pack(3) + b"\x00\n\xff"


def test_chunk_roundtrip_with_newlines_and_all_bytes():
    data = bytes(range(256)) * 4
    assert FrameReader().feed(chunk(data)) == [{"type": "FILE_CHUNK", "id": "t1", "data": data}]


def test_chunk_split_byte_by_byte():
    r = FrameReader()
    wire = chunk(b"abc\ndef") + encode({"type": "MSG", "text": "x"})
    out = []
    for i in range(len(wire)):
        out += r.feed(wire[i:i + 1])
    assert out == [{"type": "FILE_CHUNK", "id": "t1", "data": b"abc\ndef"}, {"type": "MSG", "text": "x"}]


def test_chunk_and_lines_mixed_in_one_feed():
    wire = encode({"a": 1}) + chunk(b"\n\n") + encode({"b": 2}) + chunk(b"", "t2")
    assert FrameReader().feed(wire) == [
        {"a": 1}, {"type": "FILE_CHUNK", "id": "t1", "data": b"\n\n"},
        {"b": 2}, {"type": "FILE_CHUNK", "id": "t2", "data": b""},
    ]


def test_frame_too_large():
    wire = b'{"type":"FILE_CHUNK","id":"x"}\n' + LENGTH.pack(MAX_FRAME + 1)
    out = FrameReader().feed(wire)
    assert len(out) == 1 and isinstance(out[0], FrameTooLarge)
