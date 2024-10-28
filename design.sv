module alu(
  input clk,rst_n,
  input [31:0] OperandA,
  input [31:0] OperandB,
  input [3:0] op_code,
  output reg [63:0] data_out
);
  always @(posedge clk,negedge rst_n) begin
    if(!rst_n) 
      data_out<=32'b0;
    else begin
    case(op_code) 
      4'b0000:data_out<=OperandA+OperandB;
      4'b0001:data_out<=OperandA-OperandB;
      4'b0010:data_out<=OperandA*OperandB;
      4'b0011:data_out<=OperandA/OperandB;
      4'b0100:data_out<=OperandA&OperandB;
      4'b0101:data_out<=OperandA|OperandB;
      4'b0110:data_out<={32'b0, ~OperandA};  
      4'b0111:data_out<=OperandA<<2;
      4'b1000:data_out<=OperandA>>2;
    endcase
    end
  end
endmodule
