package aes
import chisel3._

object AesTopGen extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new AesTop)
}
