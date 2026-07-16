class adder_coverage extends uvm_subscriber #(adder_seq_item);

   `uvm_component_utils(adder_coverage)

   adder_seq_item tr;

   //------------------------------------------
   // Covergroup
   //------------------------------------------

   covergroup adder_cg;

      option.per_instance = 1;

      //--------------------------------------
      // Operand A Coverage
      //--------------------------------------

      cp_A : coverpoint tr.A
      {
         bins zero     = {32'h00000000};
         bins one      = {32'h00000001};
         bins max      = {32'hFFFFFFFF};
         bins low[]    = {[0:255]};
         bins medium[] = {[256:65535]};
         bins high[]   = {[65536:$]};
      }

      //--------------------------------------
      // Operand B Coverage
      //--------------------------------------

      cp_B : coverpoint tr.B
      {
         bins zero     = {32'h00000000};
         bins one      = {32'h00000001};
         bins max      = {32'hFFFFFFFF};
         bins low[]    = {[0:255]};
         bins medium[] = {[256:65535]};
         bins high[]   = {[65536:$]};
      }

      //--------------------------------------
      // Start Signal Coverage
      //--------------------------------------

      cp_start : coverpoint tr.Start_i
      {
         bins asserted   = {1};
         bins deasserted = {0};
      }

      //--------------------------------------
      // Result Coverage
      //--------------------------------------

      cp_result : coverpoint tr.Data_O
      {
         bins zero = {0};
         bins max  = {32'hFFFFFFFF};
         bins others[] = {[1:100]};
      }

      //--------------------------------------
      // Data Valid Coverage
      //--------------------------------------

      cp_valid : coverpoint tr.Data_Valid_O
      {
         bins valid   = {1};
         bins invalid = {0};
      }

      //--------------------------------------
      // Overflow Coverage
      //--------------------------------------

      cp_overflow : coverpoint (tr.A + tr.B < tr.A)
      {
         bins no_overflow = {0};
         bins overflow    = {1};
      }

      //--------------------------------------
      // Cross Coverage
      //--------------------------------------

      cross cp_A, cp_B;

      cross cp_start, cp_valid;

   endgroup

   //------------------------------------------
   // Constructor
   //------------------------------------------

   function new(string name="adder_coverage",
                uvm_component parent);

      super.new(name,parent);

      adder_cg = new();

   endfunction

   //------------------------------------------
   // Subscriber Write
   //------------------------------------------

   function void write(adder_seq_item t);

      tr = t;

      adder_cg.sample();

   endfunction

endclass

`endif
