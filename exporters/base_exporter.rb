# frozen_string_literal: true

class BaseExporter
  def initialize(report_data:)
    @report_data = report_data
  end

  def export(file_path:)
    raise NotImplementedError, 'Subclasses must implement the export method'
  end
end
