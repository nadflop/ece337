onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case_num
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case_stage
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -divider {DUT Signals}
add wave -noupdate -color Cyan -radix unsigned -subitemconfig {{/tb_adder_16bit/tb_a[15]} {-color Cyan} {/tb_adder_16bit/tb_a[14]} {-color Cyan} {/tb_adder_16bit/tb_a[13]} {-color Cyan} {/tb_adder_16bit/tb_a[12]} {-color Cyan} {/tb_adder_16bit/tb_a[11]} {-color Cyan} {/tb_adder_16bit/tb_a[10]} {-color Cyan} {/tb_adder_16bit/tb_a[9]} {-color Cyan} {/tb_adder_16bit/tb_a[8]} {-color Cyan} {/tb_adder_16bit/tb_a[7]} {-color Cyan} {/tb_adder_16bit/tb_a[6]} {-color Cyan} {/tb_adder_16bit/tb_a[5]} {-color Cyan} {/tb_adder_16bit/tb_a[4]} {-color Cyan} {/tb_adder_16bit/tb_a[3]} {-color Cyan} {/tb_adder_16bit/tb_a[2]} {-color Cyan} {/tb_adder_16bit/tb_a[1]} {-color Cyan} {/tb_adder_16bit/tb_a[0]} {-color Cyan}} /tb_adder_16bit/tb_a
add wave -noupdate -color Cyan -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -color Cyan -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group Sum -color Violet -radix unsigned /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Sum -color Violet -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Overflow -color Coral -radix unsigned /tb_adder_16bit/tb_overflow
add wave -noupdate -expand -group Overflow -color Coral -radix unsigned /tb_adder_16bit/tb_expected_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {52352 ps}
