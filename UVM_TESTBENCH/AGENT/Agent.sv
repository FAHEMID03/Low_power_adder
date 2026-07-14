class adder_agent extends uvm_agent;

   `uvm_component_utils(adder_agent)

   //-----------------------------------------
   // Components
   //-----------------------------------------
   adder_sequencer      seqr;
   adder_driver         drv;
   adder_input_monitor  in_mon;
   adder_output_monitor out_mon;

   //-----------------------------------------
   // Virtual Interface
   //-----------------------------------------
   virtual adder_if vif;

   //-----------------------------------------
   // Constructor
   //-----------------------------------------
   function new(string name,
                uvm_component parent);

      super.new(name,parent);

   endfunction

   //-----------------------------------------
   // Build Phase
   //-----------------------------------------
   function void build_phase(uvm_phase phase);

      super.build_phase(phase);

      //----------------------------------
      // Get Virtual Interface
      //----------------------------------

      if(!uvm_config_db#(virtual adder_if)::get
      (
         this,
         "",
         "vif",
         vif
      ))
      begin
         `uvm_fatal("AGENT",
         "Virtual Interface Not Found")
      end

      //----------------------------------
      // Create Driver & Sequencer only
      // if Agent is ACTIVE
      //----------------------------------

      if(get_is_active()==UVM_ACTIVE)
      begin

         seqr = adder_sequencer::
                type_id::create("seqr",this);

         drv  = adder_driver::
                type_id::create("drv",this);

      end

      //----------------------------------
      // Always Create Monitors
      //----------------------------------

      in_mon = adder_input_monitor::
               type_id::create("in_mon",this);

      out_mon = adder_output_monitor::
                type_id::create("out_mon",this);

      //----------------------------------
      // Pass Interface
      //----------------------------------

      uvm_config_db#(virtual adder_if)::set
      (
         this,
         "drv",
         "vif",
         vif
      );

      uvm_config_db#(virtual adder_if)::set
      (
         this,
         "in_mon",
         "vif",
         vif
      );

      uvm_config_db#(virtual adder_if)::set
      (
         this,
         "out_mon",
         "vif",
         vif
      );

   endfunction

   //-----------------------------------------
   // Connect Phase
   //-----------------------------------------

   function void connect_phase(uvm_phase phase);

      super.connect_phase(phase);

      if(get_is_active()==UVM_ACTIVE)

         drv.seq_item_port.connect
         (
             seqr.seq_item_export
         );

   endfunction

endclass
