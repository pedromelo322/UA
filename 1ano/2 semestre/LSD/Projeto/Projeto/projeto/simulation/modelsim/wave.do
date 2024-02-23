onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /controlunit_tb/clk
add wave -noupdate /controlunit_tb/set_p
add wave -noupdate /controlunit_tb/set_s
add wave -noupdate /controlunit_tb/modo_temperatura_out
add wave -noupdate /controlunit_tb/modo_relogio_out
add wave -noupdate /controlunit_tb/clk_period
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {205211 ps}
