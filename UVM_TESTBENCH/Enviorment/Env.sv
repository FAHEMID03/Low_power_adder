function void connect_phase(uvm_phase phase);

   super.connect_phase(phase);

   agent.in_mon.analysis_port.connect
   (
      scoreboard.input_fifo.analysis_export
   );

   agent.out_mon.analysis_port.connect
   (
      scoreboard.output_fifo.analysis_export
   );

endfunction
