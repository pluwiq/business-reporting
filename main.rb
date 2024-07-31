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

logger = Logger.new('application.log')
logger.level = Logger::INFO

reports = {
  first_report: FirstReport,
  second_report: SecondReport,
  third_report: ThirdReport
}

exporters = {
  json: JSONExporter,
  csv: CSVExporter
}

report_generator = ReportGenerator.new(data_loader: DataLoader, reports:, exporters:)

BusinessWorker.run_report_generation(report_generator, logger, DATA_FILE, EXPORT_FILE_JSON, EXPORT_FILE_CSV)
