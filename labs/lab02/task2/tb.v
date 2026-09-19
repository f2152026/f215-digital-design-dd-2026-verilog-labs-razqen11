// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
  reg [1:0] t_s;
  wire [7:0] t_y;
  // TODO: instantiate DUT here
  lut #(
    .WIDTH(8),
    .DEPTH(4)
  ) DUT (
    .sel(t_s),
    .dout(t_y)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    // TODO: apply different input combinations
    t_s = 2'b00;
    #5;
    t_s = 2'b01;
    #5;
    t_s = 2'b10;
    #5;
    t_s = 2'b11;
    #5;
    $finish;
  end

  initial
    $monitor($time, " sel=%b | dout=%b", t_s, t_y); // change as required

endmodule
