class BaseReport
  def initialize(data:)
    @data = validate_data(data:)
  end

  private

  def validate_data(data:)
    if !data.is_a?(Array) || data.none? { |row| row.is_a?(Hash) }
      raise ArgumentError, 'Data must be an array of hashes'
    end
    data
  end

  def filter_data(key:, value:)
    @data.select { |row| row[key.to_sym] == value }
  end

  def sort_data(key:, order: :asc)
    sorted = @data.sort_by { |row| row[key.to_sym] }
    order == :desc ? sorted.reverse : sorted
  end

  def limit_data(limit:)
    @data.first(limit)
  end
end
