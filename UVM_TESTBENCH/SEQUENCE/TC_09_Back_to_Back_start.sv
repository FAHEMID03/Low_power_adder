/*class back_to_back_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(back_to_back_seq)

   task body();

      repeat(10)

      begin

         req=adder_seq_item::type_id::create("req");

         start_item(req);

         assert(req.randomize());

         req.Start_i=1;

         finish_item(req);

         // No idle cycle

      end

   endtask

endclass*/

class back_to_back_seq extends adder_base_seq;

   `uvm_object_utils(back_to_back_seq)

   task body();

      axi_write('h0000,10);

      axi_write('h0004,20);

      axi_write('h0008,1);

      axi_write('h0000,30);

      axi_write('h0004,40);

      axi_write('h0008,1);

   endtask

endclass
