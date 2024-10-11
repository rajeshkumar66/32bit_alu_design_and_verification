module alu_testbench;
reg [2:0] opcode;
reg [0:0] data_type;
reg [31:0] operand_a;
reg [31:0] operand_b;
wire [31:0] alu_output;
alu dut (
 .iw ({opcode, data_type, operand_a, operand_b}),
 .alu_out (alu_output)
);
initial begin
  $dumpfile("alu_test.vcd");
  $dumpvars(0, alu_testbench);
  opcode = 3'b010; // MUL
  data_type = 1'b0; // SIGNED
  operand_a = 32'h00000001;
  operand_b = 32'h00000002;
  #10
  opcode = 3'b011; // MUL
  data_type = 1'b0; // SIGNED
  operand_a = 32'h00000004;
  operand_b = 32'h00000004;
  #10
  $finish;
end
endmodule
