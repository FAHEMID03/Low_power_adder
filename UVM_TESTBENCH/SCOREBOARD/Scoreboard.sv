class adder_scoreboard extends uvm_scoreboard;

   `uvm_component_utils(adder_scoreboard)

   uvm_tlm_analysis_fifo #(adder_seq_item) input_fifo;
   uvm_tlm_analysis_fifo #(adder_seq_item) output_fifo;

   function new(string name,
                uvm_component parent);

      super.new(name,parent);

      input_fifo=new("input_fifo",this);
      output_fifo=new("output_fifo",this);

   endfunction

   task run_phase(uvm_phase phase);

      adder_seq_item in_tr;
      adder_seq_item out_tr;

      logic [31:0] expected;

      forever

      begin

         input_fifo.get(in_tr);

         output_fifo.get(out_tr);

         expected=in_tr.A+in_tr.B;

         if(expected==out_tr.Data_O)

            `uvm_info("SCOREBOARD",
                      $sformatf("PASS A=%0d B=%0d SUM=%0d",
                                 in_tr.A,
                                 in_tr.B,
                                 out_tr.Data_O),
                                 UVM_LOW)

         else

            `uvm_error("SCOREBOARD",$sformatf("FAIL A=%0d B=%0d Expected=%0d Actual=%0d",
                                  in_tr.A,
                                  in_tr.B,
                                  expected,
                                  out_tr.Data_O))

      end

   endtask

endclass
