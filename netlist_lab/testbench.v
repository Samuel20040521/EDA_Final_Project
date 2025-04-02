module testbench;
  reg a, b, c;
  wire y;

  top uut (.a(a), .b(b), .c(c), .y(y));  // or .t1(t1), .t2(t2)

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, testbench);

    a = 0; b = 0; c = 0; #10;
    a = 1; b = 1; c = 0; #10;
    a = 1; b = 1; c = 1; #10;
    $finish;
  end
endmodule
