# frozen_string_literal: true

require 'csv'

class CSVExporter < BaseExporter
  def export(file_path:)
    CSV.open(file_path, 'w') do |csv|
      case @report_data
      when Array
        export_array(csv:)
      when Hash
        export_hash(csv:)
      else
        raise "Unexpected data format for CSV export"
      end
    end
  end

  private

  def export_array(csv:)
    case @report_data.first
    when Hash
      export_array_of_hashes(csv:)
    when String
      export_array_of_strings(csv:)
    else
      raise "Unexpected array format for CSV export"
    end
  end

  def export_array_of_hashes(csv:)
    csv << @report_data.first.keys if @report_data.any?
    @report_data.each { |row| csv << row.values }
  end

  def export_array_of_strings(csv:)
    @report_data.each { |row| csv << [row] }
  end

  def export_hash(csv:)
    @report_data.each { |key, value| csv << [key, value] }
  end
end
