/*
 * Copyright (c) 2024 Ivan Ni
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module priority_encoder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output reg [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
 
    always @(*) begin
        if (ui_in == 8'b0 && uio_in == 8'b0) begin 
            uo_out = 8'b11110000;
        end 
        else begin 
            if (ui_in[7]) uo_out = 8'd15;
            else if (ui_in[6]) uo_out = 8'd14;
            else if (ui_in[5]) uo_out = 8'd13;
            else if (ui_in[4]) uo_out = 8'd12;
            else if (ui_in[3]) uo_out = 8'd11;
            else if (ui_in[2]) uo_out = 8'd10;
            else if (ui_in[1]) uo_out = 8'd9;
            else if (ui_in[0]) uo_out = 8'd8;
            else if (uio_in[7]) uo_out = 8'd7;
            else if (uio_in[6]) uo_out = 8'd6;
            else if (uio_in[5]) uo_out = 8'd5;
            else if (uio_in[4]) uo_out = 8'd4;
            else if (uio_in[3]) uo_out = 8'd3;
            else if (uio_in[2]) uo_out = 8'd2;
            else if (uio_in[1]) uo_out = 8'd1;
            else if (uio_in[0]) uo_out = 8'd0;
        end
    end 
    
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
