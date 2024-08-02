# frozen_string_literal: true

# @report_data contains the data to be exported and can have different structures depending on the report.
# Generally, it is an array of hashes, where each hash represents a row of data with keys corresponding to column names.
# @report_data might take:
# 1. An array of hashes: Each hash represents a row of data with keys as column names.
#    [
#      {
#        id: 42940,
#        rank: 1,
#        workers: 218,
#        company: "Loot Crate",
#        url: "loot-crate",
#        state_l: "California",
#        state_s: "CA",
#        city: "Los Angeles",
#        growth: 66788.5962,
#        revenue: 116247698,
#        ifmid: 2,
#        ifiid: 4,
#        metro: "Los Angeles",
#        industry: "Consumer Products & Services",
#        yrs_on_list: 1
#      }
#    ]
# 2. An array of strings: Each string represents a single column in a CSV file.
#    [
#      "Row 1",
#      "Row 2",
#      "Row 3"
#    ]
# 3. A hash: Each key-value pair represents a row in the CSV file with two columns.
#    This structure might be used for summary reports.
#    Example:
#    {
#      "Total Companies" => 100,
#      "Total Revenue" => 5000000
#    }
class BaseExporter
  def initialize(report_data:)
    @report_data = report_data
  end

  def export(file_path:)
    raise NotImplementedError, 'Subclasses must implement the export method'
  end
end
