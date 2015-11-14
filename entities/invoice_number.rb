require 'date'

class InvoiceNumber
  SEPARATOR = '/'

  def initialize(year = Date.today.year)
    @year = year
    @sequential = InvoiceNumber.generate_sequential
  end

  def to_s
    seq_str = @sequential.to_s.rjust(2, '0')
    "#{@year}#{SEPARATOR}#{seq_str}"
  end

  def self.generate_sequential
    1
  end
end
