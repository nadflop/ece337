# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {tx_controller.sv tx_encoder.sv tx_bit_stuffer.sv tx_timer.sv crc_16.sv flex_counter.sv tx_flex_pts_sr.sv usb_tx.sv}
elaborate usb_tx -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/usb_tx.rep
report_area >> reports/usb_tx.rep
report_power -hier >> reports/usb_tx.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/usb_tx.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
