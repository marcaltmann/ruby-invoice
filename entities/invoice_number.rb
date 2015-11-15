require 'date'

class InvoiceNumber
  SEPARATOR = '/'

  @@next_sequential_number = 1

  def self.generate_sequential
    next_number = @@next_sequential_number
    @@next_sequential_number += 1
    next_number
  end

  def initialize(date = Date.today)
    raise ArgumentError.new unless date.is_a? Date
    @year = date.year
    @sequential = InvoiceNumber.generate_sequential
  end

  def to_s
    seq_str = @sequential.to_s.rjust(2, '0')
    "#{@year}#{SEPARATOR}#{seq_str}"
  end
end
