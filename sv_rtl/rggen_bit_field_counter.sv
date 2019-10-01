module rggen_bit_field_counter #(
  parameter int             WIDTH         = 4,
  parameter bit [WIDTH-1:0] INITIAL_VALUE = '0
)(
  input   logic                 i_clk,
  input   logic                 i_rst_n,
  rggen_bit_field_if.bit_field  bit_field_if,
  input   logic                 i_clear,
  input   logic                 i_up,
  input   logic                 i_down,
  output  logic [WIDTH-1:0]     o_count
);
  logic [WIDTH-1:0] count;

  assign  o_count                 = count;
  assign  bit_field_if.read_data  = count;
  assign  bit_field_if.value      = count;

  always_ff @(posedge i_clk, negedge i_rst_n) begin
    if (!i_rst_n) begin
      count <= INITIAL_VALUE;
    end
    else if (bit_field_if.valid && (|bit_field_if.write_mask)) begin
      count <=
        (bit_field_if.write_data & ( bit_field_if.write_mask)) |
        (count                   & (~bit_field_if.write_mask));
    end
    else if (i_clear) begin
      count <= INITIAL_VALUE;
    end
    else if ({i_up, i_down} == 2'b10) begin
      count <= count + 1;
    end
    else if ({i_up, i_down} == 2'b01) begin
      count <= count - 1;
    end
  end
endmodule
