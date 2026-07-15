/*class overflow_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(overflow_seq)

   task body();

      req=adder_seq_item::type_id::create("req");

      start_item(req);

      req.A=32'hFFFFFFFF;
      req.B=32'h1;
      req.Start_i=1;

      finish_item(req);

   endtask

endclass*/
class overflow_seq extends adder_base_seq;

   `uvm_object_utils(overflow_seq)

   bit [31:0] status;
   bit [31:0] result;

   task body();

      axi_write('h0000,32'hFFFFFFFF);

      axi_write('h0004,32'h1);

      axi_write('h0008,1);

      do

         axi_read('h000C,status);

      while(status[0]==0);

      axi_read('h0010,result);

      if(result!=32'h0)

         `uvm_error("SEQ","Overflow Failed");

   endtask

endclass
