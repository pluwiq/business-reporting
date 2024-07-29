# frozen_string_literal: true

require_relative 'base_report'

class ThirdReport < BaseReport
  def initialize(data:, city: 'New York')
    super(data:)
    @city = city
  end

  def generate
    filtered_data = @data.select { |row| row[:city] == @city }
    sorted_data = filtered_data.sort_by { |row| row[:revenue].to_i }
    top_companies = sorted_data.first(10)
    top_companies.map { |row| row[:company] }
  end
end
