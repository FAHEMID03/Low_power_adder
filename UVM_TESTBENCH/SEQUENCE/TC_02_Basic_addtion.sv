class basic_add_seq extends Adder_base_seq //uvm_sequence #(adder_seq_item);

  /* adder_seq_item req;

   `uvm_object_utils(basic_add_seq)

   function new(string name="basic_add_seq");
      super.new(name);
   endfunction

   task body();

      req=adder_seq_item::type_id::create("req");

      start_item(req);

      req.A=32'd5;
      req.B=32'd3;
      req.Start_i=1;

      finish_item(req);

   endtask

endclass*/

   `uvm_object_utils(basic_add_seq)

   bit [31:0] result;
   bit [31:0] status;

   task body();

      //----------------------------------------
      // Write Operand A
      //----------------------------------------

      axi_write(32'h0000,32'd5);

      //----------------------------------------
      // Write Operand B
      //----------------------------------------

      axi_write(32'h0004,32'd3);

      //----------------------------------------
      // Start
      //----------------------------------------

      axi_write(32'h0008,32'h1);

      //----------------------------------------
      // Wait Data Valid
      //----------------------------------------

      do
      begin

         axi_read(32'h000C,status);

      end

      while(status[0]==0);

      //----------------------------------------
      // Read Result
      //----------------------------------------

      axi_read(32'h0010,result);

      if(result==8)

         `uvm_info("SEQ","PASS",UVM_LOW)

      else

         `uvm_error("SEQ","FAIL")

   endtask

endclass
