# frozen_string_literal: true

RgGen.define_list_item_feature(:bit_field, :type, :counter) do
  register_map do
    read_write
    volatile
    initial_value require: true
    reference use: true, width: 1
  end

  sv_rtl do
    build do
      if !bit_field.reference?
        input :register_block, :clear, {
          name: "i_#{full_name}_clear", data_type: :logic, width: 1,
          array_size: array_size, array_format: array_port_format
        }
      end
      input :register_block, :up, {
        name: "i_#{full_name}_up", data_type: :logic, width: 1,
        array_size: array_size, array_format: array_port_format
      }
      input :register_block, :down, {
        name: "i_#{full_name}_down", data_type: :logic, width: 1,
        array_size: array_size, array_format: array_port_format
      }
      output :register_block, :count, {
        name: "o_#{full_name}_count", data_type: :logic, width: width,
        array_size: array_size, array_format: array_port_format
      }
    end

    def clear_signal
      if bit_field.reference?
        reference_bit_field
      else
        clear[loop_variables]
      end
    end

    main_code :bit_field, from_template: true
  end

  sv_ral do
    access 'RW'
  end
end
