# frozen_string_literal: true

require 'json'

class JSONExporter < BaseExporter
  def export(file_path:)
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(@report_data))
    end
  end
end
