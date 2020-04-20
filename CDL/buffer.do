onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_data_buffer/tb_test_case_num
add wave -noupdate /tb_data_buffer/tb_test_case
add wave -noupdate /tb_data_buffer/i
add wave -noupdate /tb_data_buffer/tb_clk
add wave -noupdate /tb_data_buffer/tb_n_rst
add wave -noupdate -expand -group {Buffer Occupancy} /tb_data_buffer/tb_buffer_occupancy
add wave -noupdate -expand -group {Buffer Occupancy} /tb_data_buffer/tb_expected_buffer_occupancy
add wave -noupdate -divider {Signals from AHB}
add wave -noupdate /tb_data_buffer/tb_clear
add wave -noupdate -expand -group {RX Data} /tb_data_buffer/tb_get_rx_data
add wave -noupdate -expand -group {RX Data} -color Magenta /tb_data_buffer/tb_rx_data
add wave -noupdate -expand -group {RX Data} /tb_data_buffer/tb_expected_rx_data
add wave -noupdate -expand -group {TX Data} /tb_data_buffer/tb_store_tx_data
add wave -noupdate -expand -group {TX Data} -color Yellow /tb_data_buffer/tb_tx_data
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -divider {Signals from USB}
add wave -noupdate /tb_data_buffer/tb_flush
add wave -noupdate -expand -group {RX Packet Data} /tb_data_buffer/tb_store_rx_packet
add wave -noupdate -expand -group {RX Packet Data} -color Magenta /tb_data_buffer/tb_rx_packet_data
add wave -noupdate -expand -group {TX Packet Data} /tb_data_buffer/tb_get_tx_packet
add wave -noupdate -expand -group {TX Packet Data} -color Yellow /tb_data_buffer/tb_tx_packet_data
add wave -noupdate -expand -group {TX Packet Data} /tb_data_buffer/tb_expected_tx_packet_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150402 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
configure wave -valuecolwidth 114
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
WaveRestoreZoom {0 ps} {1050 ns}
