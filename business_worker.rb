# frozen_string_literal: true

module BusinessWorker
  def self.validate_min_employees
    loop do
      print 'Enter the minimum number of employees: '
      input = gets.chomp
      error_message = error_message(input:)
      return input.to_i if validate_input(input:)

      puts error_message
    end
  end

  def self.validate_input(input:)
    input =~ /^\d+$/ && input.to_i >= 100
  end

  def self.error_message(input:)
    return 'Error: Please enter a valid number.' unless input =~ /^\d+$/
    return 'Error: The minimum number of employees must be 100 or more. Please try again.' if input.to_i < 100
  end

  def self.get_additional_args(report_type:)
    case report_type
    when :first_report
      { min_employees: validate_min_employees }
    else
      {}
    end
  end

  def self.run_report_generation(report_generator:, logger:, data_file:, export_file_json:, export_file_csv:)
    report_type, export_type = display_menu
    additional_args = get_additional_args(report_type:)

    logger.info("Starting report generation: #{report_type}")

    export_file = export_type == :json ? export_file_json : export_file_csv

    report_generator.generate_and_export(
      report_type:,
      export_type:,
      data_file:,
      export_file:,
      **additional_args
    )

    logger.info("Report successfully generated and exported in format: #{export_type}")
  rescue => e
    logger.error("Error generating report: #{e.message}")
  end

  def self.display_menu
    report_type = choose_report_type
    export_type = choose_export_format
    [report_type, export_type]
  end

  def self.choose_report_type
    puts "Choose report type:\n" \
           "1. Companies with 100 or more employees\n" \
           "2. Number of companies by industry\n" \
           "3. Top 10 companies in New York by revenue\n"
    print "Your choice: "
    report_choice = gets.chomp.to_i

    case report_choice
    when 1 then :first_report
    when 2 then :second_report
    when 3 then :third_report
    else
      puts 'Invalid choice!'
      exit
    end
  end

  def self.choose_export_format
    puts "\nChoose export format:\n" \
           "1. JSON\n" \
           "2. CSV\n"
    print 'Your choice: '
    export_choice = gets.chomp.to_i

    case export_choice
    when 1 then :json
    when 2 then :csv
    else
      puts 'Invalid choice!'
      exit
    end
  end
end
