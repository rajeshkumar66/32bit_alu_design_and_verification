`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "interface.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module tb_top;
  environment env;
  bit clk,rst_n;
  parameter clk_period=10;
  always #(clk_period/2) clk=~clk;
  intf vif(clk,rst_n);
  alu dut(.clk(vif.clk),
          .rst_n(vif.rst_n),
          .OperandA(vif.OperandA),
          .OperandB(vif.OperandB),
          .op_code(vif.op_code),
          .data_out(vif.data_out)
         );
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
    clk=1;
    rst_n=1;
    #1000 $finish;
  end
  initial begin
    env=new(vif);
    env.run();
  end
endmodule
  
          
    
