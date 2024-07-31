# frozen_string_literal: true

require 'json'

class JSONExporter < BaseExporter
  def export(file_path:)
    File.write(file_path, JSON.pretty_generate(@report_data))
  end
end
