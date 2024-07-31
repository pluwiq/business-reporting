# frozen_string_literal: true

require_relative 'services/data_loader'
require_relative 'services/report_generator'
require_relative 'reports/base_report'
require_relative 'reports/first_report'
require_relative 'reports/second_report'
require_relative 'reports/third_report'
require_relative 'exporters/base_exporter'
require_relative 'exporters/json_exporter'
require_relative 'exporters/csv_exporter'
require_relative 'business_worker'
require 'logger'

DATA_FILE = 'data/data.csv'
EXPORT_FILE_JSON = 'report.json'
EXPORT_FILE_CSV = 'report.csv'

REPORTS = {
  first_report: FirstReport,
  second_report: SecondReport,
  third_report: ThirdReport
}

EXPORTERS = {
  json: JSONExporter,
  csv: CSVExporter
}

logger = Logger.new('application.log')
logger.level = Logger::INFO

report_generator = ReportGenerator.new(data_loader: DataLoader, reports: REPORTS, exporters: EXPORTERS)

BusinessWorker.run_report_generation(
  report_generator:,
  logger:,
  data_file: DATA_FILE,
  export_file_json: EXPORT_FILE_JSON,
  export_file_csv: EXPORT_FILE_CSV
)
