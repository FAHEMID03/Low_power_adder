class adder_regression_test extends uvm_test;

   `uvm_component_utils(adder_regression_test)

   function new(string name="adder_regression_test",
                uvm_component parent);
      super.new(name,parent);
   endfunction

   task run_phase(uvm_phase phase);

      basic_add_seq            basic_seq;
      zero_add_seq             zero_seq;
      overflow_seq             ovf_seq;
      random_seq               rnd_seq;
      latency_seq              lat_seq;
      multiple_transaction_seq mul_seq;
      back_to_back_seq         b2b_seq;
      idle_seq                 idle;

      phase.raise_objection(this);

      basic_seq = basic_add_seq::type_id::create("basic_seq");
      zero_seq  = zero_add_seq::type_id::create("zero_seq");
      ovf_seq   = overflow_seq::type_id::create("ovf_seq");
      rnd_seq   = random_seq::type_id::create("rnd_seq");
      lat_seq   = latency_seq::type_id::create("lat_seq");
      mul_seq   = multiple_transaction_seq::type_id::create("mul_seq");
      b2b_seq   = back_to_back_seq::type_id::create("b2b_seq");
      idle      = idle_seq::type_id::create("idle");

      basic_seq.start(env.agent.sequencer);
      zero_seq.start(env.agent.sequencer);
      ovf_seq.start(env.agent.sequencer);
      rnd_seq.start(env.agent.sequencer);
      lat_seq.start(env.agent.sequencer);
      mul_seq.start(env.agent.sequencer);
      b2b_seq.start(env.agent.sequencer);
      idle.start(env.agent.sequencer);

      phase.drop_objection(this);

   endtask

endclass
