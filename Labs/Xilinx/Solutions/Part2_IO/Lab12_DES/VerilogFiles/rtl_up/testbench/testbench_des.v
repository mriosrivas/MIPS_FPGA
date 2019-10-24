// testbench.v
// 3 March 2017
//
// Drive the mipsfpga_sys module for simulation testing

module testbench;
  reg  [1:64] key;
  reg  [1:0]  encryptDecrypt;
  reg  [1:64] dataIn;
  wire [1:64] dataOut;



  mfp_des dut(.key(key),
          .encryptDecrypt(encryptDecrypt),
          .dataIn(dataIn),
          .dataOut(dataOut));


    initial
    begin
        // check encryption
        dataIn = 64'h0123456789ABCDEF;
		encryptDecrypt = 2'b01;
        key = 64'h133457799BBCDFF1;
		# 200;
		if (dataOut == 64'h85E813540F0AB405)
		  $display("Match1.\n");
		else
		  $display("Not Match1.\n");
		  
		dataIn = 64'h596F7572206C6970;
		key = 64'h0E329232EA6D0D73;
		# 200;
		if (dataOut == 64'hC0999FDDE378D7ED)
		  $display("Match2.\n");
		else
		  $display("Not Match2.\n");

        // check decryption
        dataIn = 64'h85E813540F0AB405;
		encryptDecrypt = 2'b10;
        key = 64'h133457799BBCDFF1;
		# 200;
		if (dataOut == 64'h0123456789ABCDEF)
		  $display("Match3.\n");
		else
		  $display("Not Match3.\n");
		  
		dataIn = 64'hC0999FDDE378D7ED;
		key = 64'h0E329232EA6D0D73;
		# 200;
		if (dataOut == 64'h596F7572206C6970)
		  $display("Match4.\n");
		else
		  $display("Not Match4.\n");

        // check dataOut = dataIn
        dataIn = 64'h85E813540F0AB405;
        encryptDecrypt = 2'b0;
        # 200;
        if (dataOut == 64'h85E813540F0AB405)
          $display("Match5.\n");
        else
          $display("Not Match5.\n");

        dataIn = 64'h1122334455667788;
        # 200;
        if (dataOut == 64'h1122334455667788)
          $display("Match6.\n");
        else
          $display("Not Match6.\n");
		
        $stop;
    end

    initial
    begin
        $dumpvars;
        $timeformat (-9, 1, "ns", 10);
    end
    
endmodule


