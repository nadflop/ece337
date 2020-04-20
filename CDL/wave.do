onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_tx/tb_test_case
add wave -noupdate /tb_usb_tx/tb_test_num
add wave -noupdate /tb_usb_tx/DUT/clk
add wave -noupdate /tb_usb_tx/DUT/n_rst
add wave -noupdate /tb_usb_tx/DUT/tx_transfer_active
add wave -noupdate -radix hexadecimal /tb_usb_tx/DUT/tx_packet
add wave -noupdate /tb_usb_tx/DUT/get_tx_packet_data
add wave -noupdate /tb_usb_tx/DUT/tx_packet_data
add wave -noupdate /tb_usb_tx/DUT/tx_enable
add wave -noupdate /tb_usb_tx/DUT/tx_error
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_sync
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_pid_data
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_ack
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_nack
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_stall
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_eop
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_crc1
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_crc2
add wave -noupdate -group {Load signals} /tb_usb_tx/DUT/load_data
add wave -noupdate -group Timer /tb_usb_tx/DUT/enable_timer
add wave -noupdate -group Timer /tb_usb_tx/DUT/clear_8
add wave -noupdate -group Timer /tb_usb_tx/DUT/clear_64
add wave -noupdate -group Timer /tb_usb_tx/DUT/roll_val
add wave -noupdate -group Timer /tb_usb_tx/DUT/shift_enable
add wave -noupdate -group Timer /tb_usb_tx/DUT/packet_done
add wave -noupdate /tb_usb_tx/DUT/init_crc
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /tb_usb_tx/DUT/buffer_occupancy
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/next_data
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/state
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/next_state
add wave -noupdate /tb_usb_tx/DUT/pause
add wave -noupdate /tb_usb_tx/DUT/crc_out
add wave -noupdate /tb_usb_tx/DUT/serial_out
add wave -noupdate /tb_usb_tx/DUT/dplus_out
add wave -noupdate /tb_usb_tx/DUT/dminus_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4505549 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
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
WaveRestoreZoom {0 ps} {10273428 ps}
