from protocol import MAX_LINE, LineReader, LineTooLong, encode


def test_message_split_byte_by_byte():
    r = LineReader()
    data = encode({"type": "MSG", "text": "olá"})
    out = []
    for i in range(len(data)):
        out += r.feed(data[i:i + 1])
    assert out == [{"type": "MSG", "text": "olá"}]


def test_utf8_cut_in_the_middle_of_a_character():
    r = LineReader()
    data = encode({"text": "ç"})
    cut = data.index("ç".encode()) + 1  # a meio dos 2 bytes de 'ç'
    assert r.feed(data[:cut]) == []
    assert r.feed(data[cut:]) == [{"text": "ç"}]


def test_several_messages_in_one_feed():
    r = LineReader()
    data = encode({"a": 1}) + encode({"b": 2}) + b'{"c":'
    assert r.feed(data) == [{"a": 1}, {"b": 2}]
    assert r.feed(b"3}\n") == [{"c": 3}]


def test_empty_lines_are_ignored():
    assert LineReader().feed(b"\n\r\n  \n") == []


def test_bad_json_and_non_object():
    out = LineReader().feed(b"{bad\n[1,2]\n\xff\xfe\n" + encode({"ok": True}))
    assert [type(m) for m in out[:3]] == [ValueError] * 3
    assert out[3] == {"ok": True}


def test_line_too_long_without_newline():
    r = LineReader()
    out = r.feed(b"x" * (MAX_LINE + 1))
    assert len(out) == 1 and isinstance(out[0], LineTooLong)


def test_line_too_long_with_newline_keeps_earlier_messages():
    out = LineReader().feed(encode({"a": 1}) + b"x" * (MAX_LINE + 1) + b"\n")
    assert out[0] == {"a": 1}
    assert isinstance(out[1], LineTooLong)


def test_newline_inside_text_is_escaped():
    assert encode({"text": "a\nb"}).count(b"\n") == 1
