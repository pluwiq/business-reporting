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
require 'logger'

data_file = 'data/data.csv'
export_file_json = 'report.json'
export_file_csv = 'report.csv'

logger = Logger.new('application.log')
logger.level = Logger::INFO

reports = {
  'first_report' => FirstReport,
  'second_report' => SecondReport,
  'third_report' => ThirdReport
}

exporters = {
  'json' => JSONExporter,
  'csv' => CSVExporter
}

report_generator = ReportGenerator.new(data_loader: DataLoader, reports:, exporters:)

def display_menu
  puts "Choose report type:"
  puts "1. Companies with 100 or more employees"
  puts "2. Number of companies by industry"
  puts "3. Top 10 companies in New York by revenue"
  print "Your choice: "
  report_choice = gets.chomp.to_i

  report_type = case report_choice
                when 1 then 'first_report'
                when 2 then 'second_report'
                when 3 then 'third_report'
                else
                  puts "Invalid choice!"
                  exit
                end

  puts "\nChoose export format:"
  puts "1. JSON"
  puts "2. CSV"
  print "Your choice: "
  export_choice = gets.chomp.to_i

  export_type = case export_choice
                when 1 then 'json'
                when 2 then 'csv'
                else
                  puts "Invalid choice!"
                  exit
                end

  [report_type, export_type]
end

def get_additional_args(report_type:)
  case report_type
  when 'first_report'
    min_employees = nil
    loop do
      print "Enter the minimum number of employees: "
      min_employees = gets.chomp.to_i
      puts "Error: The minimum number of employees must be 100 or more. Please try again." if min_employees < 100
      next if min_employees < 100
      break
    end
    { min_employees: }
  when 'second_report', 'third_report'
    {}
  else
    {}
  end
end

begin
  report_type, export_type = display_menu
  additional_args = get_additional_args(report_type:)

  logger.info("Starting report generation: #{report_type}")

  report_generator.generate_and_export(
    report_type:,
    export_type:,
    data_file:,
    export_file: export_type == 'json' ? export_file_json : export_file_csv,
    **additional_args
  )

  logger.info("Report successfully generated and exported in format: #{export_type}")
rescue => e
  logger.error("Error generating report: #{e.message}")
end
