onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_soc/tb_test_case
add wave -noupdate /tb_ahb_lite_soc/tb_test_case_num
add wave -noupdate /tb_ahb_lite_soc/tb_clk
add wave -noupdate /tb_ahb_lite_soc/tb_n_rst
add wave -noupdate /tb_ahb_lite_soc/tb_enable_transactions
add wave -noupdate /tb_ahb_lite_soc/tb_enqueue_transaction
add wave -noupdate /tb_ahb_lite_soc/tb_transaction_fake
add wave -noupdate /tb_ahb_lite_soc/tb_current_addr_transaction_num
add wave -noupdate /tb_ahb_lite_soc/tb_current_addr_beat_num
add wave -noupdate /tb_ahb_lite_soc/tb_model_reset
add wave -noupdate -group {Current Data Num} /tb_ahb_lite_soc/tb_current_data_transaction_num
add wave -noupdate -group {Current Data Num} /tb_ahb_lite_soc/tb_current_data_beat_num
add wave -noupdate -group {Current Data Num} /tb_ahb_lite_soc/tb_current_data_transaction_error
add wave -noupdate -expand -group Error /tb_ahb_lite_soc/tb_current_addr_transaction_error
add wave -noupdate -expand -group Error /tb_ahb_lite_soc/tb_transaction_error
add wave -noupdate -expand -group Error /tb_ahb_lite_soc/tb_hresp
add wave -noupdate -group Burst /tb_ahb_lite_soc/tb_hburst
add wave -noupdate -group Burst /tb_ahb_lite_soc/tb_transaction_burst
add wave -noupdate /tb_ahb_lite_soc/tb_mismatch
add wave -noupdate /tb_ahb_lite_soc/tb_check
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /tb_ahb_lite_soc/tb_transaction_write
add wave -noupdate -radix hexadecimal /tb_ahb_lite_soc/tb_htrans
add wave -noupdate /tb_ahb_lite_soc/tb_hsel
add wave -noupdate /tb_ahb_lite_soc/tb_hwrite
add wave -noupdate -expand -group Address -radix hexadecimal /tb_ahb_lite_soc/tb_transaction_addr
add wave -noupdate -expand -group Address -radix hexadecimal /tb_ahb_lite_soc/tb_haddr
add wave -noupdate -expand -group Size /tb_ahb_lite_soc/tb_transaction_size
add wave -noupdate -expand -group Size /tb_ahb_lite_soc/tb_hsize
add wave -noupdate /tb_ahb_lite_soc/tb_hready
add wave -noupdate -group Data /tb_ahb_lite_soc/tb_hwdata
add wave -noupdate -group Data -expand /tb_ahb_lite_soc/tb_hrdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1070000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 276
configure wave -valuecolwidth 346
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
WaveRestoreZoom {666229 ps} {1473771 ps}
