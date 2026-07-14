class adder_seq_item extends uvm_sequence_item;

  rand bit [31:0] A;
  rand bit [31:0] B;
  rand bit        Start_i;

       bit [31:0] Data_O;
       bit        Data_Valid_O;

  `uvm_object_utils_begin(adder_seq_item)
      `uvm_field_int(A,UVM_ALL_ON)
      `uvm_field_int(B,UVM_ALL_ON)
      `uvm_field_int(Start_i,UVM_ALL_ON)
      `uvm_field_int(Data_O,UVM_ALL_ON)
      `uvm_field_int(Data_Valid_O,UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="adder_seq_item");
      super.new(name);
  endfunction

endclass
