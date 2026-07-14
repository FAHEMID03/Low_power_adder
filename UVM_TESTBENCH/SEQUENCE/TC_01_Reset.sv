class reset_sequence extends uvm_sequence #(adder_seq_item);

   `uvm_object_utils(reset_sequence)

   function new(string name="reset_sequence");
      super.new(name);
   endfunction

   task body();

      `uvm_info(get_type_name(),
      "Waiting for Reset Completion",UVM_LOW)

      #100ns;

   endtask

endclass
