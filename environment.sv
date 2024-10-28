class environment;
  generator gen;
  monitor mon;
  driver drv;
  scoreboard srb;
  mailbox g2d=new();
  mailbox m2s=new();
  virtual intf vif;
  function new(virtual intf vif);begin
    this.vif=vif;
    gen=new(g2d);
    drv=new(g2d,vif);
    mon=new(m2s,vif);
    srb=new(m2s);
  end
  endfunction
  task run(); 
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
    #100
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
    #100
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
    #100
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
    #100
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
    #100
    fork 
      gen.run();
      drv.run();
      mon.run();
      srb.run();
    join
  endtask
endclass
