class adder_axi_test extends uvm_test;

   `uvm_component_utils(adder_axi_test)

   basic_add_seq seq;

   function new(string name="adder_axi_test",
                uvm_component parent=null);

      super.new(name,parent);

   endfunction

   task run_phase(uvm_phase phase);

      phase.raise_objection(this);

      seq=basic_add_seq::type_id::create("seq");

      seq.start(env.axi_agent.sequencer);

      phase.drop_objection(this);

   endtask

endclass
