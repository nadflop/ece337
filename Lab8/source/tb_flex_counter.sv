// $Id: $
// File name:   tb_flex_counter.sv
// Created:     2/6/2019
// Author:      Nur Nadhira Aqilah Binti Mohd Shah
// Lab Section: 2
// Version:     1.0  Initial Design Entry
// Description: Testbench for flex counter

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 2.5;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = 1; // Check right before the setup time starts
  localparam  INACTIVE_VALUE     = 1'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  localparam  RESET_COUNT_OUTPUT_VALUE = {4{1'b0}};

  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [3:0] tb_rollover_val;
  wire [3:0] tb_count_out;
  wire tb_rollover_flag;
 
  //Declare testbench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

  // Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0; //reset is active low

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic  expected_rollover;
    input logic  [3:0] expected_output;
    input string check_tag;
  begin
    if(expected_rollover == tb_rollover_flag) begin // Check passed
      $info("Correct rollover flag output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover flag output %s during %s test case", check_tag, tb_test_case);
    end
    if(expected_output == tb_count_out) begin // Check passed
      $info("Correct counter output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect counter output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  //task for normal clear (pulse the clear for 1 cycle)
  task normal_clear;
  begin
    // Activate the clear
    tb_clear = 1'b1; //clear is active high

    // Maintain the clear for one cycle
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_clear = 1'b0;

    // Leave out of clear for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), 
		   .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

 // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_count_enable  = INACTIVE_VALUE; // Initialize input to inactive  value
    tb_rollover_val  = {4{1'b0}}; // Initialize input to inactive  value
    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b0011; // Set to be the the non-reset value
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output( RESET_OUTPUT_VALUE, RESET_COUNT_OUTPUT_VALUE, 
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_OUTPUT_VALUE, RESET_COUNT_OUTPUT_VALUE, 
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_OUTPUT_VALUE, RESET_COUNT_OUTPUT_VALUE, 
                  "after reset was released");
    // ************************************************************************
    // Test Case 2: Rollover with value that's not a power of '2'
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover with value that's not a power of '2'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val = 4'b0011;
    reset_dut();

    // Assign test case stimulus
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0011;
    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));

    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b1,  4'b0011,
                  "after processing delay");
    // ************************************************************************
    // Test Case 3: Continuos counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuos counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b1111; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b1111;
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    #12 //wait for a bit
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b1000,
                  "after processing delay");

    // ************************************************************************
    // Test Case 4: Discontinuos counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuos counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b0011; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b0011;
    tb_count_enable = 1'b0;
    tb_clear = 1'b0;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    //assert count_enable 
    tb_count_enable = 1'b1;

    #12 //wait for a bit
    //set back count_enable to 0
    tb_count_enable = 1'b0;
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b0010,
                  "after processing delay");
    // ************************************************************************
    // Test Case 5: Clearing and counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing and counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b1100; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b1100;
    tb_count_enable = 1'b1;
    tb_clear = 1'b1;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    //assert count_enable 
    tb_count_enable = 1'b1;

    #12 //wait for a bit
    //set back count_enable to 0
    tb_count_enable = 1'b0;
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b0000,
                  "after processing delay");

    // ************************************************************************
    // Test Case 6: Clearing while counting 
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing while counting";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b1010; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b1010;
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    //set back count_enable to 0
    tb_count_enable = 1'b0;
    //assert clear
    normal_clear();
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b0000,
                  "after processing delay");
    // ************************************************************************
    // Test Case 7: Rollover force count to 1 
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover force count to 1";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b0010; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b0010;
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    //set back count_enable to 0
    tb_count_enable = 1'b0;
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b0001,
                  "after processing delay");
    // ************************************************************************
    // Test Case 8: Reset while everything is asserted 
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Reset while everything is asserted";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear  = INACTIVE_VALUE; // Set to be the the non-reset value
    tb_count_enable = INACTIVE_VALUE; //Set to be the non-reset value
    tb_rollover_val  = 4'b0010; // Set to be the the non-reset value
    reset_dut();

    // Assign test case stimulus
    tb_rollover_val = 4'b0010;
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;
    tb_n_rst = 1'b0;

    // Wait until test is inside the setup time before the next rising clock edge
    #(CLK_PERIOD - (FF_SETUP_TIME * 0.5));
    tb_count_enable = 1'b0;
    // Wait for DUT to process stimulus before checking results
    @(posedge tb_clk); 
    @(posedge tb_clk); 
    // Move away from risign edge and allow for propagation delays before checking
    #(CHECK_DELAY);
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);
    // Check results
    check_output( 1'b0, 4'b0000,
                  "after processing delay");
    reset_dut();
  end
endmodule
