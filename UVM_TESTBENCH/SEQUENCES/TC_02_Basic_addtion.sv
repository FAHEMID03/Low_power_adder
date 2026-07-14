class basic_add_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

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

endclass
