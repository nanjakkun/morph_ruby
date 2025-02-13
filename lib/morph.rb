# frozen_string_literal: true

require 'zeitwerk'

if Zeitwerk::Loader.all_dirs.empty?
  loader = Zeitwerk::Loader.new
  loader.push_dir(__dir__)
  loader.setup
  loader.eager_load
end

module Morph
end
