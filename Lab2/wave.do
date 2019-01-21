onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_adder_4bit/DUT/a
add wave -noupdate /tb_adder_4bit/DUT/b
add wave -noupdate /tb_adder_4bit/DUT/carry_in
add wave -noupdate /tb_adder_4bit/DUT/carrys
add wave -noupdate /tb_adder_4bit/DUT/overflow
add wave -noupdate /tb_adder_4bit/DUT/sum
add wave -noupdate -divider {tb variables}
add wave -noupdate /tb_adder_4bit/tb_a
add wave -noupdate /tb_adder_4bit/tb_b
add wave -noupdate /tb_adder_4bit/tb_carry_in
add wave -noupdate /tb_adder_4bit/tb_expected_outputs
add wave -noupdate /tb_adder_4bit/tb_overflow
add wave -noupdate /tb_adder_4bit/tb_sum
add wave -noupdate /tb_adder_4bit/tb_test_case
add wave -noupdate /tb_adder_4bit/tb_test_inputs
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {889 ps}
