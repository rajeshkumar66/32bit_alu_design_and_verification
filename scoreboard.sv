class scoreboard;
  transaction t;
  mailbox m2s;
  function new(mailbox m2s);begin
    this.m2s=m2s;
  end
  endfunction
  task run(); begin
    m2s.get(t);
    t.display("Scoreboard Signals");
    case(t.op_code) 
      4'b0000:if(t.data_out==t.OperandA+t.OperandB)
        $display("Addition Succesfull");
      4'b0001:if(t.data_out==t.OperandA-t.OperandB)
        $display("Subtraction Succesfull");
      4'b0010:if(t.data_out==t.OperandA*t.OperandB)
        $display("Multiplication Successfull");
      4'b0011:if(t.data_out==t.OperandA/t.OperandB)
        $display("Division Succesfull");
      4'b0100:if(t.data_out==t.OperandA&t.OperandB)
        $display("AND Operation Succesfull");
      4'b0101:if(t.data_out==t.OperandA|t.OperandB)
        $display("OR Operation Succesfull");
      4'b0110:if(t.data_out=={32'b0, ~t.OperandA})
        $display("NOT Operation Succesfull");
      4'b0111:if(t.data_out==t.OperandA<<2)
        $display("Left Shift Succesfull");
      4'b1000:if(t.data_out==t.OperandA>>2)
        $display("Right Shift Succcesfull");
    endcase
    end
    endtask   
endclass
