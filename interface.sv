interface intf(input logic clk,rst_n);
  logic [31:0] OperandA;
  logic [31:0] OperandB;
  logic [3:0] op_code;
  logic [63:0] data_out;
endinterface
