class idle_seq extends uvm_sequence #(adder_seq_item);

   `uvm_object_utils(idle_seq)

   function new(string name="idle_seq");
      super.new(name);
   endfunction

   task body();

      `uvm_info(get_name(),
      "Keeping interface Idle",
      UVM_LOW)

      #500ns;

   endtask

endclass
