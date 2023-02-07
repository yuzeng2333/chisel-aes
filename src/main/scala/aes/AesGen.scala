package aes

object AesTopGen extends AesTop {
  (new chisel3.stage.ChiselStage).emitVerilog(new AesTop)
}
