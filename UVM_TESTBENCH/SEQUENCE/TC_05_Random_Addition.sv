/*class random_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(random_seq)

   task body();

      repeat(100)

      begin

         req=adder_seq_item::type_id::create("req");

         start_item(req);

         assert(req.randomize());

         req.Start_i=1;

         finish_item(req);

      end

   endtask

endclass*/

class random_add_seq extends adder_base_seq;

   `uvm_object_utils(random_add_seq)

   bit [31:0] a;
   bit [31:0] b;

   bit [31:0] result;
   bit [31:0] status;

   task body();

      repeat(100)

      begin

         a=$urandom();

         b=$urandom();

         axi_write('h0000,a);

         axi_write('h0004,b);

         axi_write('h0008,1);

         do

            axi_read('h000C,status);

         while(status[0]==0);

         axi_read('h0010,result);

         if(result!=(a+b))

            `uvm_error("SEQ","Random Failed");

      end

   endtask

endclass
