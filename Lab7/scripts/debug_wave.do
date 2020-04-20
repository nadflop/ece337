onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_filter/tb_std_test_case
add wave -noupdate /tb_fir_filter/tb_test_case_num
add wave -noupdate /tb_fir_filter/tb_test_sample_num
add wave -noupdate /tb_fir_filter/tb_clk
add wave -noupdate /tb_fir_filter/tb_n_reset
add wave -noupdate /tb_fir_filter/tb_load_coeff
add wave -noupdate -radix hexadecimal /tb_fir_filter/tb_coeff
add wave -noupdate /tb_fir_filter/tb_data_ready
add wave -noupdate -radix unsigned /tb_fir_filter/tb_sample
add wave -noupdate /tb_fir_filter/tb_modwait
add wave -noupdate -expand -group err /tb_fir_filter/tb_err
add wave -noupdate -expand -group err /tb_fir_filter/tb_expected_err
add wave -noupdate -expand -group fir -radix unsigned /tb_fir_filter/tb_fir_out
add wave -noupdate -expand -group fir -radix unsigned /tb_fir_filter/tb_expected_fir_out
add wave -noupdate -expand -group one_k /tb_fir_filter/tb_one_k_samples
add wave -noupdate -expand -group one_k /tb_fir_filter/tb_expected_one_k_samples
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /tb_fir_filter/DUT/lc
add wave -noupdate /tb_fir_filter/DUT/dr
add wave -noupdate /tb_fir_filter/DUT/overflow
add wave -noupdate -divider ctrl_outs
add wave -noupdate /tb_fir_filter/DUT/modwait
add wave -noupdate /tb_fir_filter/DUT/op
add wave -noupdate /tb_fir_filter/DUT/src1
add wave -noupdate /tb_fir_filter/DUT/src2
add wave -noupdate /tb_fir_filter/DUT/dest
add wave -noupdate /tb_fir_filter/DUT/err
add wave -noupdate -divider state
add wave -noupdate /tb_fir_filter/DUT/CTRL/state
add wave -noupdate /tb_fir_filter/DUT/CTRL/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {490000 ps} 1} {{Cursor 2} {571616 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 236
configure wave -valuecolwidth 61
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
WaveRestoreZoom {0 ps} {980001 ps}
