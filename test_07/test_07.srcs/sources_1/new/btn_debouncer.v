`timescale 1ns / 1ps

module btn_debouncer #(
    parameter integer DebounceCount = 1_000_000  // 100 MHz 기준 10 ms
) (
    input  wire clk,
    input  wire reset,
    input  wire noisy_btn,
    output reg  clean_btn
);

  reg [$clog2(DebounceCount)-1:0] r_count;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      r_count   <= 0;
      clean_btn <= 0;
    end else if (noisy_btn == clean_btn) begin
      // 입력이 현재 안정 상태와 같으면 카운터 초기화
      r_count <= 0;
    end else if (r_count == DebounceCount - 1) begin
      // 변경된 입력이 Debounce 시간 동안 유지되면 상태 갱신
      r_count   <= 0;
      clean_btn <= noisy_btn;
    end else begin
      // 입력 변화가 유지되는 시간을 측정
      r_count <= r_count + 1;
    end
  end

endmodule
