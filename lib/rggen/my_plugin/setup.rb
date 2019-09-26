# frozen_string_literal: true

path = File.expand_path('../..', __dir__)
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rggen/default'
require 'rggen/my_plugin'

RgGen.setup :'rggen-my-plugin', RgGen::MyPlugin do |builder|
  builder.enable :bit_field, :type, [:foo]
end
