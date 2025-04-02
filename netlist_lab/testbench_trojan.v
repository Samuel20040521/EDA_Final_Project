`timescale 1ns/1ps

module testbench;
  reg a, b, c, t1, t2;
  wire y;

  top uut (
    .a(a), .b(b), .c(c),
    .t1(t1), .t2(t2),
    .y(y)
  );

  initial begin
    $dumpfile("waveform_trojan.vcd");
    $dumpvars(0, testbench);

    // 不觸發 Trojan
    a = 1; b = 1; c = 0; t1 = 0; t2 = 0; #10;

    // 模擬正常變化（還沒觸發 Trojan）
    a = 1; b = 0; c = 1; t1 = 0; t2 = 1; #10;

    // 觸發 Trojan
    a = 1; b = 1; c = 0; t1 = 1; t2 = 1; #10;

    // Trojan 持續作用
    a = 0; b = 0; c = 1; t1 = 1; t2 = 1; #10;

    $finish;
  end
endmodule
