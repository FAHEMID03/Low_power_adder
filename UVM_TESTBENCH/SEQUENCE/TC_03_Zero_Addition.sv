/*class zero_add_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(zero_add_seq)

   task body();

      req=adder_seq_item::type_id::create("req");

      start_item(req);

      req.A=0;
      req.B=0;
      req.Start_i=1;

      finish_item(req);

   endtask

endclass*/

class zero_add_seq extends adder_base_seq;

   `uvm_object_utils(zero_add_seq)

   bit [31:0] status;
   bit [31:0] result;

   task body();

      axi_write('h0000,0);

      axi_write('h0004,0);

      axi_write('h0008,1);

      do

         axi_read('h000C,status);

      while(status[0]==0);

      axi_read('h0010,result);

      if(result!=0)

         `uvm_error("SEQ","Zero Addition Failed")

   endtask

endclass
