class monitor;
  transaction t;
  mailbox m2s;
  virtual intf vif;
  function new(mailbox m2s,virtual intf vif); begin
    this.m2s=m2s;
    this.vif=vif;
  end
  endfunction
  task run();
    #15;
    t=new();
    t.OperandA=vif.OperandA;
    t.OperandB=vif.OperandB;
    t.op_code=vif.op_code;
    t.data_out=vif.data_out;
    m2s.put(t);
    t.display("Monitor Class Signals");
  endtask
endclass
