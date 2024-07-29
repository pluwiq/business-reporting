# frozen_string_literal: true

require_relative 'base_report'

class SecondReport < BaseReport
  def initialize(data:)
    super(data:)
  end

  def generate
    industry_counts = @data.group_by { |row| row[:industry] }
    industry_counts.transform_values(&:count)
  end
end
