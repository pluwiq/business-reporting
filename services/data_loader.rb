# frozen_string_literal: true

require 'csv'

class DataLoader
  def self.load_data(file_path:)
    raise "File not found: #{file_path}" unless File.exist?(file_path)

    CSV.read(file_path, headers: true, header_converters: :symbol).map(&:to_h)
  end
end
