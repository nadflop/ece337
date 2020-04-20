onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group timing /tb_rcv_block/tb_test_num
add wave -noupdate -group timing /tb_rcv_block/tb_clk
add wave -noupdate -group timing /tb_rcv_block/tb_n_rst
add wave -noupdate -group timing -label period /tb_rcv_block/tb_test_bit_period
add wave -noupdate -expand -group data -color Coral -label input /tb_rcv_block/tb_serial_in
add wave -noupdate -expand -group data -color Coral -label output /tb_rcv_block/tb_rx_data
add wave -noupdate -expand -group data -color Coral -label {test data} /tb_rcv_block/tb_test_data
add wave -noupdate -expand -group data -color Coral -label {expected output} /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -expand -group {Data reading} -color {Cornflower Blue} /tb_rcv_block/tb_data_read
add wave -noupdate -expand -group {Data reading} -color {Cornflower Blue} /tb_rcv_block/tb_test_data_read
add wave -noupdate -expand -group {Data reading} -color {Cornflower Blue} /tb_rcv_block/tb_data_ready
add wave -noupdate -expand -group {Data reading} -color {Cornflower Blue} /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -group Error -color {Orange Red} /tb_rcv_block/tb_overrun_error
add wave -noupdate -group Error -color Orange /tb_rcv_block/tb_expected_overrun
add wave -noupdate -group Error -color {Orange Red} /tb_rcv_block/tb_framing_error
add wave -noupdate -group Error -color Orange /tb_rcv_block/tb_expected_framing_error
add wave -noupdate /tb_rcv_block/tb_test_stop_bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {10000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 367
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {260640 ps}
