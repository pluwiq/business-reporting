# frozen_string_literal: true

require_relative 'base_report'

class ThirdReport < BaseReport
  def initialize(data:, city: 'New York')
    super(data:)
    @city = city
  end

  def generate
    @data
      .select { |row| row[:city] == @city }
      .sort_by { |row| row[:revenue].to_i }
      .first(10)
      .map { |row| row[:company] }
  end
end
