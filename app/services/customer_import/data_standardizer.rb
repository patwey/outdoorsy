class CustomerImport::DataStandardizer
  def self.standardize_length(length)
    length.to_i
  end

  def self.standardize_kind(kind)
    kind.downcase
  end

  def initialize(data)
    @data = data
  end

  def run
    force_utf8_encoding
    standardize_column_separators
  end

  private

  attr_reader :data

  def force_utf8_encoding
    data.force_encoding(Encoding::UTF_8)
  end

  def standardize_column_separators
    data.gsub("|", ",")
  end
end
