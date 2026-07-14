class adder_driver extends uvm_driver #(adder_seq_item);

   `uvm_component_utils(adder_driver)

   virtual adder_if vif;

   function new(string name,
                uvm_component parent);

      super.new(name,parent);

   endfunction

   function void build_phase(uvm_phase phase);

      if(!uvm_config_db#(virtual adder_if)::get(this,"","vif",vif))
         `uvm_fatal("DRV","Virtual Interface Not Found")

   endfunction

   task run_phase(uvm_phase phase);

      forever
      begin

         seq_item_port.get_next_item(req);

         drive(req);

         seq_item_port.item_done();

      end

   endtask

   task drive(adder_seq_item tr);

      @(posedge vif.clk);

      vif.A <= tr.A;
      vif.B <= tr.B;

      vif.Start_i <= 1'b1;

      @(posedge vif.clk);

      vif.Start_i <= 1'b0;

   endtask

endclass
