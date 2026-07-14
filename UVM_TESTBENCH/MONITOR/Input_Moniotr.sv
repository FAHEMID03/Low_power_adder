class adder_input_monitor extends uvm_monitor;

   `uvm_component_utils(adder_input_monitor)

   virtual adder_if vif;

   uvm_analysis_port #(adder_seq_item) analysis_port;

   function new(string name,
                uvm_component parent);

      super.new(name,parent);

      analysis_port=new("analysis_port",this);

   endfunction

   task run_phase(uvm_phase phase);

      adder_seq_item tr;

      forever

      begin

         @(posedge vif.clk);

         if(vif.Start_i)

         begin

            tr=adder_seq_item::type_id::create("tr");

            tr.A=vif.A;
            tr.B=vif.B;
            tr.Start_i=1;

            analysis_port.write(tr);

         end

      end

   endtask

endclass
