onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_test_case
add wave -noupdate /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate /tb_ahb_lite_slave/tb_clk
add wave -noupdate /tb_ahb_lite_slave/tb_n_rst
add wave -noupdate -group transaction /tb_ahb_lite_slave/tb_enable_transactions
add wave -noupdate -group transaction /tb_ahb_lite_slave/tb_enqueue_transaction
add wave -noupdate -group transaction /tb_ahb_lite_slave/tb_current_transaction_num
add wave -noupdate -group transaction /tb_ahb_lite_slave/tb_current_transaction_error
add wave -noupdate -group new_coeff /tb_ahb_lite_slave/tb_new_coeff_set
add wave -noupdate -group new_coeff /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/tb_fir_coefficient
add wave -noupdate /tb_ahb_lite_slave/tb_fir_out
add wave -noupdate /tb_ahb_lite_slave/tb_err
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -expand -group {next_state logic} /tb_ahb_lite_slave/tb_htrans
add wave -noupdate -expand -group {next_state logic} /tb_ahb_lite_slave/tb_hsel
add wave -noupdate -expand -group {next_state logic} /tb_ahb_lite_slave/tb_hwrite
add wave -noupdate /tb_ahb_lite_slave/tb_haddr
add wave -noupdate /tb_ahb_lite_slave/tb_hrdata
add wave -noupdate /tb_ahb_lite_slave/tb_hresp
add wave -noupdate /tb_ahb_lite_slave/tb_hsize
add wave -noupdate /tb_ahb_lite_slave/tb_hwdata
add wave -noupdate /tb_ahb_lite_slave/tb_modwait
add wave -noupdate -expand -group data_ready /tb_ahb_lite_slave/tb_data_ready
add wave -noupdate -expand -group data_ready /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate -group sample_data /tb_ahb_lite_slave/tb_sample_data
add wave -noupdate -group sample_data /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate -group {register file} /tb_ahb_lite_slave/DUT/next_rf
add wave -noupdate -group {register file} /tb_ahb_lite_slave/DUT/rf
add wave -noupdate /tb_ahb_lite_slave/DUT/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {235000 ps} 0} {{Cursor 2} {140000 ps} 1}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {1050 ns}
