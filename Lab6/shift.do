onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rcv_block/tb_serial_in
add wave -noupdate /tb_rcv_block/tb_rx_data
add wave -noupdate /tb_rcv_block/DUT/SHIFT/packet_data
add wave -noupdate /tb_rcv_block/DUT/SHIFT/parallel_out
add wave -noupdate /tb_rcv_block/tb_expected_rx_data
add wave -noupdate /tb_rcv_block/DUT/SHIFT/shift_strobe
add wave -noupdate /tb_rcv_block/DUT/START/start_bit_detected
add wave -noupdate -divider {bit count}
add wave -noupdate /tb_rcv_block/DUT/TIMER/bit_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {303750 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 296
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
WaveRestoreZoom {0 ps} {430080 ps}
