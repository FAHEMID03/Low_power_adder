covergroup axi_cg;

   option.per_instance = 1;

   //----------------------------------
   // Write Address
   //----------------------------------

   cp_awaddr : coverpoint awaddr
   {
      bins reg_a      = {32'h0000};
      bins reg_b      = {32'h0004};
      bins control    = {32'h0008};
      bins status     = {32'h000C};
      bins result     = {32'h0010};
   }

   //----------------------------------
   // Read Address
   //----------------------------------

   cp_araddr : coverpoint araddr
   {
      bins reg_a      = {32'h0000};
      bins reg_b      = {32'h0004};
      bins control    = {32'h0008};
      bins status     = {32'h000C};
      bins result     = {32'h0010};
   }

   //----------------------------------
   // Write Transaction
   //----------------------------------

   cp_write : coverpoint awvalid
   {
      bins write = {1};
   }

   //----------------------------------
   // Read Transaction
   //----------------------------------

   cp_read : coverpoint arvalid
   {
      bins read = {1};
   }

   //----------------------------------
   // Write Response
   //----------------------------------

   cp_bresp : coverpoint bresp
   {
      bins okay   = {2'b00};
      bins slverr = {2'b10};
   }

   //----------------------------------
   // Read Response
   //----------------------------------

   cp_rresp : coverpoint rresp
   {
      bins okay   = {2'b00};
      bins slverr = {2'b10};
   }

   //----------------------------------
   // Cross Coverage
   //----------------------------------

   cross cp_awaddr, cp_write;

   cross cp_araddr, cp_read;

endgroup
