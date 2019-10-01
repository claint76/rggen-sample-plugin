package sample_ral_pkg;
  import uvm_pkg::*;
  import rggen_ral_pkg::*;
  `include "uvm_macros.svh"
  `include "rggen_ral_macros.svh"
  class register_0_reg_model extends rggen_ral_reg;
    rand rggen_ral_field bit_field_0;
    rand rggen_ral_field bit_field_1;
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field_model(bit_field_0, 0, 4, RW, 1, 4'h0, 1)
      `rggen_ral_create_field_model(bit_field_1, 8, 4, RW, 1, 4'h0, 1)
    endfunction
  endclass
  class register_1_reg_model extends rggen_ral_reg;
    rand rggen_ral_field bit_field_0[4];
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field_model(bit_field_0[0], 0, 4, RW, 1, 4'h0, 1)
      `rggen_ral_create_field_model(bit_field_0[1], 8, 4, RW, 1, 4'h0, 1)
      `rggen_ral_create_field_model(bit_field_0[2], 16, 4, RW, 1, 4'h0, 1)
      `rggen_ral_create_field_model(bit_field_0[3], 24, 4, RW, 1, 4'h0, 1)
    endfunction
  endclass
  class register_2_reg_model extends rggen_ral_reg;
    rand rggen_ral_w1trg_field bit_field_0;
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field_model(bit_field_0, 0, 1, W1TRG, 0, 1'h0, 0)
    endfunction
  endclass
  class sample_block_model extends rggen_ral_block;
    rand register_0_reg_model register_0;
    rand register_1_reg_model register_1[2][2];
    rand register_2_reg_model register_2;
    function new(string name);
      super.new(name);
    endfunction
    function void build();
      `rggen_ral_create_reg_model(register_0, '{}, 8'h00, RW, 0, g_register_0.u_register)
      `rggen_ral_create_reg_model(register_1[0][0], '{0, 0}, 8'h04, RW, 0, g_register_1.g[0].g[0].u_register)
      `rggen_ral_create_reg_model(register_1[0][1], '{0, 1}, 8'h08, RW, 0, g_register_1.g[0].g[1].u_register)
      `rggen_ral_create_reg_model(register_1[1][0], '{1, 0}, 8'h0c, RW, 0, g_register_1.g[1].g[0].u_register)
      `rggen_ral_create_reg_model(register_1[1][1], '{1, 1}, 8'h10, RW, 0, g_register_1.g[1].g[1].u_register)
      `rggen_ral_create_reg_model(register_2, '{}, 8'h18, WO, 0, g_register_2.u_register)
    endfunction
    function uvm_reg_map create_default_map();
      return create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);
    endfunction
  endclass
endpackage
