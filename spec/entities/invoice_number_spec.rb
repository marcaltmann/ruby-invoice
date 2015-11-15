require 'date'
require 'entities/invoice_number'

describe InvoiceNumber do
  before(:example) do
    # Static counter must start at 1 each time
    load 'entities/invoice_number.rb'
  end

  describe 'prefix' do
    it 'should consist of year, separator and sequential number' do
      invoice_number = InvoiceNumber.new(2015)

      expect(invoice_number.to_s).to eq('2015/01')
    end

    it 'if no year is given, should consist of current year and sequential number' do
      invoice_number = InvoiceNumber.new

      year_str = Date.today.year.to_s
      expect(invoice_number.to_s).to eq("#{year_str}/01")
    end
  end

  describe 'sequential number generator' do
    it 'should return a sequential number beginning at 1' do
      expect(InvoiceNumber.generate_sequential).to eq(1)
      expect(InvoiceNumber.generate_sequential).to eq(2)
      expect(InvoiceNumber.generate_sequential).to eq(3)
    end
  end
end
