`include "../output-simplified/AesTop.v"
`timescale 1ns / 1ps

module tb_AesTop;
  reg          clock;
  reg          reset;
  reg          io_encIntf_text_valid;
  reg  [127:0] io_encIntf_text_bits_0;
  wire         io_encIntf_cipher_valid;
  wire [127:0] io_encIntf_cipher_bits_0;
  wire         io_decIntf_text_valid;
  wire [127:0] io_decIntf_text_bits_0;
  reg          io_decIntf_cipher_valid;
  reg  [127:0] io_decIntf_cipher_bits_0;
  reg  [127:0] io_key;
  reg          io_startKeyExp;
  wire         io_keyExpReady;
  wire         io_encEngReady;
  wire         io_decEngReady;

  AesTop dut (
    .clock(clock),
    .reset(reset),
    .io_encIntf_text_valid(io_encIntf_text_valid),
    .io_encIntf_text_bits_0(io_encIntf_text_bits_0),
    .io_encIntf_cipher_valid(io_encIntf_cipher_valid),
    .io_encIntf_cipher_bits_0(io_encIntf_cipher_bits_0),
    .io_decIntf_text_valid(io_decIntf_text_valid),
    .io_decIntf_text_bits_0(io_decIntf_text_bits_0),
    .io_decIntf_cipher_valid(io_decIntf_cipher_valid),
    .io_decIntf_cipher_bits_0(io_decIntf_cipher_bits_0),
    .io_key(io_key),
    .io_startKeyExp(io_startKeyExp),
    .io_keyExpReady(io_keyExpReady),
    .io_encEngReady(io_encEngReady),
    .io_decEngReady(io_decEngReady)
  );

  // Clock generation
  always begin
    #5 clock = ~clock;
  end

  // Testbench stimulus
  initial begin
    // Initialize signals
    //$dumpfile("wave.vcd");
    //$dumpvars(0, tb_AesTop);
    clock                   = 0;
    reset                   = 1;
    io_encIntf_text_valid   = 0;
    io_encIntf_text_bits_0  = 128'h0;
    io_decIntf_cipher_valid = 0;
    io_decIntf_cipher_bits_0= 128'h0;
    io_key                  = 128'h0;
    io_startKeyExp          = 0;

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;

    // Set key and start key expansion
    io_key         = 128'h0123456789abcdef0123456789abcdef;
    io_startKeyExp = 1;
    #10;
    io_startKeyExp = 0;

    // Wait for key expansion to be ready
    @(posedge io_keyExpReady);

    // Apply test vectors
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aabbccddeeff;
    // Wait for the encrypted data
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aab59274eeff;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // first block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aab59274eeff;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // second block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h0123456789abcdef0123456789abcdef;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // third block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hdeadbeefdeadbeefdeadbeefdeadbeef;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // fourth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hfedcba9876543210fedcba9876543210;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // fifth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00000000000000000000000000000001;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // sixth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hfffffffffffffffffffffffffffffffe;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // seventh block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h123456789abcdef0123456789abcdef0;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // eighth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h01010101010101010101010101010101;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // ninth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // tenth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aabbccddeeff;
    // Wait for the encrypted data
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aab59274eeff;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // first block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00112233445566778899aab59274eeff;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // second block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h0123456789abcdef0123456789abcdef;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // third block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hdeadbeefdeadbeefdeadbeefdeadbeef;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // fourth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hfedcba9876543210fedcba9876543210;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // fifth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h00000000000000000000000000000001;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // sixth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'hfffffffffffffffffffffffffffffffe;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // seventh block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h123456789abcdef0123456789abcdef0;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // eighth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h01010101010101010101010101010101;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // ninth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100

    // tenth block
    io_encIntf_text_valid  = 1;
    io_encIntf_text_bits_0 = 128'h7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f;
    @(posedge io_encIntf_cipher_valid);
    io_encIntf_text_valid  = 0;

    #100







    // Apply the encrypted data for decryption
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100


    // first block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // second block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // third block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h01010101010101010101010101010101;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // fourth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h123456789abcdef0123456789abcdef0;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // fifth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hfedcba9876543210fedcba9876543210;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // sixth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hdeadbeefdeadbeefdeadbeefdeadbeef;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // seventh block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h00000000000000000000000000000001;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // eighth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hfffffffffffffffffffffffffffffffe;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // ninth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h0123456789abcdef0123456789abcdef;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    // tenth block
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h7fffffffffffffffffffffffffffffff;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100
    
    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h01010101010101010101010101010101;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h123456789abcdef0123456789abcdef0;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hfedcba9876543210fedcba9876543210;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hdeadbeefdeadbeefdeadbeefdeadbeef;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h00000000000000000000000000000001;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'hfffffffffffffffffffffffffffffffe;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h0123456789abcdef0123456789abcdef;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100

    io_decIntf_cipher_valid = 1;
    io_decIntf_cipher_bits_0 = 128'h7fffffffffffffffffffffffffffffff;
    @(posedge io_decIntf_text_valid);
    io_decIntf_cipher_valid = 0;
    #100


    // Check if the decrypted data matches the original plaintext
    //if (io_decIntf_text_bits_0 === io_encIntf_text_bits_0) begin
    //  $display("Decrypted data matches the original plaintext. Test passed.");
    //end else begin
    //  $display("Decrypted data does not match the original plaintext. Test failed.");
    //end
    
    // Finish the simulation
    $finish;    
    end
endmodule
