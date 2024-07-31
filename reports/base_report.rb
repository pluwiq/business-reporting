class BaseReport
  def initialize(data:)
    validate_data(data:)
    @data = data
  end

  protected

  def validate_data(data:)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Hash) }
      raise ArgumentError, 'Data must be an array of hashes'
    end
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
