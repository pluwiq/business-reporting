# frozen_string_literal: true

require_relative 'base_report'

class FirstReport < BaseReport
  def initialize(data:, min_employees:)
    super(data: data)
    @min_employees = min_employees
  end

  def generate
    @data.select { |row| row[:workers].to_i >= @min_employees }
  end
end
