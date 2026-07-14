class adder_seq_item extends uvm_sequence_item;

   rand bit [31:0] A;
   rand bit [31:0] B;
   rand bit        Start_i;

   bit [31:0] exp_sum;

   `uvm_object_utils(adder_seq_item)

   function new(string name="adder_seq_item");
      super.new(name);
   endfunction

   function void post_randomize();
      exp_sum = A + B;
   endfunction

endclass
