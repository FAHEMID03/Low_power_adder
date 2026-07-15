class adder_axi_test extends uvm_test;

   task run_phase(uvm_phase phase);

      phase.raise_objection(this);

      axi_write(32'h00,32'd5);

      axi_write(32'h04,32'd3);

      axi_write(32'h08,32'h1);

      wait_for_valid();

      axi_read(32'h10,data);

      if(data==8)
         `uvm_info("PASS","Adder Passed",UVM_LOW)
      else
         `uvm_error("FAIL","Adder Failed")

      phase.drop_objection(this);

   endtask

endclass
