# services/report_generator.rb

class ReportGenerator
  def initialize(data_loader:, reports:, exporters:)
    @data_loader = data_loader
    @reports = reports
    @exporters = exporters
  end

  def generate_and_export(report_type:, export_type:, data_file:, export_file:, **additional_args)
    @exporters[export_type]
      .new(
        report_data: @reports[report_type]
                       .new(data: @data_loader.load_data(file_path: data_file), **additional_args)
                       .generate
      )
      .export(file_path: export_file)
  end
end
