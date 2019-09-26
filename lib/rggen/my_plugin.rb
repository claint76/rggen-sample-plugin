# frozen_string_literal: true

require_relative 'my_plugin/version'

module RgGen
  module MyPlugin
    PLUGIN_FILES = [
      'my_plugin/bit_field/type/foo'
    ].freeze

    def self.default_setup(_builder)
      PLUGIN_FILES.each { |file| require_relative file }
    end
  end
end
