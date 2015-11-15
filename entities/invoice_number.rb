require 'date'

class InvoiceNumber
  SEPARATOR = '/'

  @@next_sequential_number = {}

  def self.generate_sequential(prefix)
    if @@next_sequential_number.has_key?(prefix)
      @@next_sequential_number[prefix] += 1
    else
      @@next_sequential_number[prefix] = 1
    end
    @@next_sequential_number[prefix]
  end

  def initialize(date = Date.today)
    raise ArgumentError.new unless date.is_a? Date
    @prefix = date.year.to_s
    @sequential = InvoiceNumber.generate_sequential(@prefix)
  end

  def to_s
    seq_str = @sequential.to_s.rjust(2, '0')
    "#{@prefix}#{SEPARATOR}#{seq_str}"
  end
end
