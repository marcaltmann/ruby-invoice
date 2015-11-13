require 'entities/invoice.rb'

describe Invoice do
  let(:invoice) { Invoice.new(customer_name: 'Franz Beckenbauer', service: 'something', amount: 9.95, date: Date.today) }
  let(:invalid_invoice) { Invoice.new(customer_name: nil, service: nil, amount: nil, date: nil) }

  it 'can create a new invoice' do
    invoice
  end

  it 'can persist an invoice' do
    invoice.persist
  end

  describe 'validation' do
    it 'should be successful for an object with all fields present' do
      invoice.validate
    end

    it 'should throw an error for an object with all fields blank' do
      expect { invalid_invoice.validate }.to raise_error(StandardError)
    end
  end
end
