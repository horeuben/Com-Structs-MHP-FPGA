/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip,
    output reg a,
    output reg b,
    output reg c,
    input sum,
    input carry,
    output reg pwr
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [3-1:0] M_mf_toled;
  reg [1-1:0] M_mf_dipsw;
  myfsm_2 mf (
    .clk(clk),
    .rst(rst),
    .dipsw(M_mf_dipsw),
    .toled(M_mf_toled)
  );
  
  wire [7-1:0] M_seg_segs;
  reg [2-1:0] M_seg_char;
  seven_seg_3 seg (
    .char(M_seg_char),
    .segs(M_seg_segs)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    pwr = 1'h1;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    M_mf_dipsw = io_dip[0+0+0-:1];
    io_led[0+7-:8] = M_mf_toled;
    a = M_mf_toled[0+0-:1];
    b = M_mf_toled[1+0-:1];
    c = M_mf_toled[2+0-:1];
    M_seg_char = carry + carry + sum;
    io_seg = ~M_seg_segs;
    io_sel = 4'he;
  end
endmodule
