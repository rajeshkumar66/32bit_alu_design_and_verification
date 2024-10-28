class transaction;
  rand logic [31:0] OperandA;
  rand logic [31:0] OperandB;
  rand logic [3:0] op_code;
  logic [63:0] data_out;
  constraint op_code_c { op_code < 4'b1001; }
  constraint OperandA_c{OperandA>=0;}
  constraint OperandB_c{OperandB>=0;}
  function void display(string name); begin
    $display("-------------%s---------------",name);
    $display("OperandA=%0b , OperandB=%0b , op_code=%0b , data_out=%0b",OperandA,OperandB,op_code,data_out);
  end
  endfunction
endclass
    
    
    
