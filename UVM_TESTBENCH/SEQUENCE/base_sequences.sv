class adder_base_seq extends uvm_sequence #(svt_axi_master_transaction);

   `uvm_object_utils(adder_base_seq)

   svt_axi_master_transaction tr;

   function new(string name="adder_base_seq");
      super.new(name);
   endfunction

   //------------------------------------------------
   // AXI WRITE
   //------------------------------------------------
   virtual task axi_write(bit [31:0] addr,
                          bit [31:0] data);

      tr = svt_axi_master_transaction::type_id::create("tr");

      start_item(tr);

      tr.xact_type = svt_axi_transaction::WRITE;

      tr.addr = addr;

      tr.data = new[1];

      tr.data[0] = data;

      tr.burst_type = svt_axi_transaction::BURST_FIXED;

      tr.burst_length = 1;

      finish_item(tr);

   endtask

   //------------------------------------------------
   // AXI READ
   //------------------------------------------------

   virtual task axi_read(bit [31:0] addr,
                         output bit [31:0] data);

      tr = svt_axi_master_transaction::type_id::create("tr");

      start_item(tr);

      tr.xact_type = svt_axi_transaction::READ;

      tr.addr = addr;

      tr.burst_length = 1;

      finish_item(tr);

      data = tr.data[0];

   endtask

endclass
