# frozen_string_literal: true

require 'csv'

class DataLoader
  def self.load_data(file_path:)
    unless File.exist?(file_path)
      raise "File not found: #{file_path}"
    end

    data = []
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      data << row.to_h
    end
    data
  end
end
