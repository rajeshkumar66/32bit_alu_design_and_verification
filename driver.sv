class driver;
  transaction t;
  mailbox g2d;
  virtual intf vif;
  function new(mailbox g2d,virtual intf vif);begin
    this.g2d=g2d;
    this.vif=vif;
  end
  endfunction
  task run();begin
    g2d.get(t);
    vif.OperandA=t.OperandA;
    vif.OperandB=t.OperandB;
    vif.op_code=t.op_code;
    t.display("Driver Class Signals");
    end
    #15;
  endtask
endclass
