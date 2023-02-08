package aes

import chisel3.stage.ChiselStage

object AesGen extends App {
  val myverilog = (new ChiselStage).emitVerilog(
    new AesTop(),

    Array("--target-dir", "output/")
    )
}
