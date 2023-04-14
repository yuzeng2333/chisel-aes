module AesTop(
  input   clock,
  input   reset,
  input   io_encIntf_text_valid,
  output  io_encIntf_cipher_valid,
  input   io_startKeyExp,
  output  io_keyExpReady,
  output  io_encEngReady,
  output  io_decEngReady
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg  startKeyExp; // @[AesTop.scala 29:28]
  reg [1:0] _T; // @[KeyExpansion.scala 19:28]
  reg [3:0] _T_1; // @[KeyExpansion.scala 20:24]
  reg  expKeyValid; // @[KeyExpansion.scala 21:28]
  wire  _T_2 = _T == 2'h0; // @[KeyExpansion.scala 23:21]
  wire  _T_3 = _T == 2'h1; // @[KeyExpansion.scala 29:27]
  wire [3:0] _T_5 = 4'ha - 4'h1; // @[KeyExpansion.scala 30:37]
  wire  _T_6 = _T_1 == _T_5; // @[KeyExpansion.scala 30:19]
  wire [3:0] _T_8 = _T_1 + 4'h1; // @[KeyExpansion.scala 33:24]
  wire  _T_9 = _T == 2'h2; // @[KeyExpansion.scala 34:27]
  wire  _GEN_5 = _T_9 | expKeyValid; // @[KeyExpansion.scala 34:42]
  reg [1:0] _T_464; // @[AesTop.scala 52:27]
  reg [4:0] _T_465; // @[AesTop.scala 53:26]
  wire  _T_466 = _T_464 == 2'h0; // @[AesTop.scala 55:20]
  wire  _T_467 = _T_464 == 2'h1; // @[AesTop.scala 59:27]
  wire  _T_468 = ~io_keyExpReady; // @[AesTop.scala 60:13]
  wire  _T_469 = _T_464 == 2'h2; // @[AesTop.scala 66:27]
  wire  _T_470 = _T_465 == 5'h1; // @[AesTop.scala 67:21]
  wire [4:0] _T_472 = _T_465 - 5'h1; // @[AesTop.scala 70:28]
  reg [1:0] _T_474; // @[AesTop.scala 52:27]
  reg [4:0] _T_475; // @[AesTop.scala 53:26]
  wire  _T_476 = _T_474 == 2'h0; // @[AesTop.scala 55:20]
  wire  _T_477 = _T_474 == 2'h1; // @[AesTop.scala 59:27]
  wire  _T_479 = _T_474 == 2'h2; // @[AesTop.scala 66:27]
  wire  _T_480 = _T_475 == 5'h1; // @[AesTop.scala 67:21]
  wire [4:0] _T_482 = _T_475 - 5'h1; // @[AesTop.scala 70:28]
  reg  _T_484; // @[AesTop.scala 35:30]
  wire  _T_485 = ~_T_484; // @[AesTop.scala 37:23]
  wire  _GEN_1204 = startKeyExp | _T_484; // @[AesTop.scala 38:26]
  reg  _T_488; // @[Reg.scala 15:16]
  reg  _T_489; // @[Reg.scala 15:16]
  reg  _T_490; // @[Reg.scala 15:16]
  reg  _T_491; // @[Reg.scala 15:16]
  reg  _T_492; // @[Reg.scala 15:16]
  reg  _T_493; // @[Reg.scala 15:16]
  reg  _T_494; // @[Reg.scala 15:16]
  reg  _T_495; // @[Reg.scala 15:16]
  reg  _T_496; // @[Reg.scala 15:16]
  reg  _T_497; // @[Reg.scala 15:16]
  reg  _T_498; // @[Reg.scala 15:16]
  assign io_encIntf_cipher_valid = _T_498; // @[AesTop.scala 81:27]
  assign io_keyExpReady = ~_T_484; // @[AesTop.scala 79:18]
  assign io_encEngReady = _T_464 == 2'h1; // @[AesTop.scala 77:18]
  assign io_decEngReady = _T_474 == 2'h1; // @[AesTop.scala 78:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  startKeyExp = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  _T_1 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  expKeyValid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  _T_464 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  _T_465 = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  _T_474 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  _T_475 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  _T_484 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  _T_488 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  _T_489 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  _T_490 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  _T_491 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  _T_492 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  _T_493 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  _T_494 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  _T_495 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  _T_496 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  _T_497 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  _T_498 = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      startKeyExp <= 1'h0;
    end else begin
      startKeyExp <= io_startKeyExp;
    end
    if (reset) begin
      _T <= 2'h0;
    end else if (_T_2) begin
      if (startKeyExp) begin
        _T <= 2'h1;
      end
    end else if (_T_3) begin
      if (_T_6) begin
        _T <= 2'h2;
      end
    end else if (_T_9) begin
      _T <= 2'h0;
    end
    if (reset) begin
      _T_1 <= 4'h0;
    end else if (_T_2) begin
      _T_1 <= 4'h0;
    end else if (_T_3) begin
      _T_1 <= _T_8;
    end else if (_T_9) begin
      _T_1 <= 4'h0;
    end
    if (reset) begin
      expKeyValid <= 1'h0;
    end else if (_T_2) begin
      if (startKeyExp) begin
        expKeyValid <= 1'h0;
      end
    end else if (!(_T_3)) begin
      expKeyValid <= _GEN_5;
    end
    if (reset) begin
      _T_464 <= 2'h0;
    end else if (_T_466) begin
      if (expKeyValid) begin
        _T_464 <= 2'h1;
      end
    end else if (_T_467) begin
      if (_T_468) begin
        _T_464 <= 2'h0;
      end else if (io_encIntf_text_valid) begin
        _T_464 <= 2'h1;
      end
    end else if (_T_469) begin
      if (_T_470) begin
        _T_464 <= 2'h1;
      end
    end
    if (reset) begin
      _T_465 <= 5'h0;
    end else if (!(_T_466)) begin
      if (_T_467) begin
        if (!(_T_468)) begin
          if (io_encIntf_text_valid) begin
            _T_465 <= 5'h0;
          end
        end
      end else if (_T_469) begin
        if (!(_T_470)) begin
          _T_465 <= _T_472;
        end
      end
    end
    if (reset) begin
      _T_474 <= 2'h0;
    end else if (_T_476) begin
      if (expKeyValid) begin
        _T_474 <= 2'h1;
      end
    end else if (_T_477) begin
      if (_T_468) begin
        _T_474 <= 2'h0;
      end
    end else if (_T_479) begin
      if (_T_480) begin
        _T_474 <= 2'h1;
      end
    end
    if (reset) begin
      _T_475 <= 5'h0;
    end else if (!(_T_476)) begin
      if (!(_T_477)) begin
        if (_T_479) begin
          if (!(_T_480)) begin
            _T_475 <= _T_482;
          end
        end
      end
    end
    if (reset) begin
      _T_484 <= 1'h0;
    end else if (_T_485) begin
      _T_484 <= _GEN_1204;
    end else if (_T_484) begin
      if (expKeyValid) begin
        _T_484 <= 1'h0;
      end
    end
    _T_488 <= io_encIntf_text_valid;
    _T_489 <= _T_488;
    _T_490 <= _T_489;
    _T_491 <= _T_490;
    _T_492 <= _T_491;
    _T_493 <= _T_492;
    _T_494 <= _T_493;
    _T_495 <= _T_494;
    _T_496 <= _T_495;
    _T_497 <= _T_496;
    _T_498 <= _T_497;
  end
endmodule
module AesTopSimp(
  input          clock,
  input          reset,
  input          io_encIntf_text_valid,
  input  [127:0] io_encIntf_text_bits_0,
  output         io_encIntf_cipher_valid,
  output [127:0] io_encIntf_cipher_bits_0,
  output         io_decIntf_text_valid,
  output [127:0] io_decIntf_text_bits_0,
  input          io_decIntf_cipher_valid,
  input  [127:0] io_decIntf_cipher_bits_0,
  input  [127:0] io_key,
  input          io_startKeyExp,
  output         io_keyExpReady,
  output         io_encEngReady,
  output         io_decEngReady
);
  wire  aesTop_clock; // @[AesTop.scala 135:22]
  wire  aesTop_reset; // @[AesTop.scala 135:22]
  wire  aesTop_io_encIntf_text_valid; // @[AesTop.scala 135:22]
  wire  aesTop_io_encIntf_cipher_valid; // @[AesTop.scala 135:22]
  wire  aesTop_io_startKeyExp; // @[AesTop.scala 135:22]
  wire  aesTop_io_keyExpReady; // @[AesTop.scala 135:22]
  wire  aesTop_io_encEngReady; // @[AesTop.scala 135:22]
  wire  aesTop_io_decEngReady; // @[AesTop.scala 135:22]
  AesTop aesTop ( // @[AesTop.scala 135:22]
    .clock(aesTop_clock),
    .reset(aesTop_reset),
    .io_encIntf_text_valid(aesTop_io_encIntf_text_valid),
    .io_encIntf_cipher_valid(aesTop_io_encIntf_cipher_valid),
    .io_startKeyExp(aesTop_io_startKeyExp),
    .io_keyExpReady(aesTop_io_keyExpReady),
    .io_encEngReady(aesTop_io_encEngReady),
    .io_decEngReady(aesTop_io_decEngReady)
  );
  assign io_encIntf_cipher_valid = aesTop_io_encIntf_cipher_valid; // @[AesTop.scala 150:14]
  assign io_encIntf_cipher_bits_0 = 128'h0; // @[AesTop.scala 150:14]
  assign io_decIntf_text_valid = 1'h0; // @[AesTop.scala 146:25]
  assign io_decIntf_text_bits_0 = 128'h0; // @[AesTop.scala 145:27]
  assign io_keyExpReady = aesTop_io_keyExpReady; // @[AesTop.scala 155:18]
  assign io_encEngReady = aesTop_io_encEngReady; // @[AesTop.scala 156:18]
  assign io_decEngReady = aesTop_io_decEngReady; // @[AesTop.scala 157:18]
  assign aesTop_clock = clock;
  assign aesTop_reset = reset;
  assign aesTop_io_encIntf_text_valid = io_encIntf_text_valid; // @[AesTop.scala 150:14]
  assign aesTop_io_startKeyExp = io_startKeyExp; // @[AesTop.scala 154:18]
endmodule
