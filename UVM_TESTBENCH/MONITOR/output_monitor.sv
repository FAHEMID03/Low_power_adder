class adder_output_monitor extends uvm_monitor;

   `uvm_component_utils(adder_output_monitor)

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

         if(vif.Data_Valid_O)

         begin

            tr=adder_seq_item::type_id::create("tr");

            tr.Data_O=vif.Data_O;
            tr.Data_Valid_O=1;

            analysis_port.write(tr);

         end

      end

   endtask

endclass
