class generator;
  transaction t;
  mailbox g2d;
  function new(mailbox g2d);
    this.g2d=g2d;
  endfunction
  task run();begin
    t=new();
    t.randomize();
    g2d.put(t);
    t.display("Generator Class Signals");
  end
  endtask
endclass
