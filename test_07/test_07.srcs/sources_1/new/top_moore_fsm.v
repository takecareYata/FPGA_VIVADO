`timescale 1ns / 1ps

module top_moore_fsm (
    input  wire clk,
    input  wire reset,
    input  wire btnC,
    output wire led
);

  wire w_clean_btn;

  btn_debouncer u_btn_debouncer (
      .clk(clk),
      .reset(reset),
      .noisy_btn(btnC),
      .clean_btn(w_clean_btn)
  );

  moore_fsm_101 u_moore_fsm_101 (
      .clk(clk),
      .reset(reset),
      .x(w_clean_btn),
      .y(led)
  );

endmodule
