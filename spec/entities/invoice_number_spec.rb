require 'entities/invoice_number.rb'

describe InvoiceNumber do
  it 'should consist of year, separator and sequential number' do
    invoice_number = InvoiceNumber.new(2015)

    expect(invoice_number.to_s).to eq('2015/01')
  end

  it 'if no year is given, should consist of current year and sequential number' do
  end

  describe 'number generator' do
    it 'should always return 1 (preliminary)' do
      # should not be public in the end
      expect(InvoiceNumber.generate_sequential).to eq(1)
    end
  end
end
