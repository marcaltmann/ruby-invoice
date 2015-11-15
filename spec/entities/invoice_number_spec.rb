require 'date'
require 'entities/invoice_number'

describe InvoiceNumber do
  before(:example) do
    # Static counter must start at 1 each time
    load 'entities/invoice_number.rb'
  end

  describe 'prefix' do
    it 'should consist of year, separator and sequential number' do
      invoice_number = InvoiceNumber.new(Date.parse('2013-07-01'))
      expect(invoice_number.to_s).to eq('2013/01')
    end

    it 'if no year is given, should consist of current year and sequential number' do
      invoice_number = InvoiceNumber.new

      year_str = Date.today.year.to_s
      expect(invoice_number.to_s).to eq("#{year_str}/01")
    end

    it 'should throw an error if no Date is given as an argument' do
      expect { InvoiceNumber.new('String') }.to raise_error(ArgumentError)
    end
  end

  describe 'sequential number generator' do
    it 'given a prefix, should return a number beginning at 1' do
      expect(InvoiceNumber.new(Date.parse('2012-01-01')).to_s).to eq('2012/01')
      expect(InvoiceNumber.new(Date.parse('2012-01-01')).to_s).to eq('2012/02')
      expect(InvoiceNumber.new(Date.parse('2012-01-01')).to_s).to eq('2012/03')
    end

    it 'should count for each prefix separately' do
      expect(InvoiceNumber.new(Date.parse('2012-01-01')).to_s).to eq('2012/01')
      expect(InvoiceNumber.new(Date.parse('2013-01-01')).to_s).to eq('2013/01')
    end
  end
end
