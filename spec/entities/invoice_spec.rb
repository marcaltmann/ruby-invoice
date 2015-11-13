require 'entities/invoice.rb'

describe Invoice do
  let(:invoice) { Invoice.new(customer_name: 'Franz Beckenbauer', service: 'something', amount: 9.95, date: Date.today) }

  it 'can create a new invoice' do
    invoice
  end

  describe 'persistance' do
    it 'validates the Invoice' do
      allow(invoice).to receive(:validate)
      invoice.persist
      expect(invoice).to have_received(:validate)
    end
  end

  describe 'validation' do
    it 'should be successful for an object with all fields present' do
      invoice.validate
    end

    it 'should throw an error for an Invoice missing the customer name' do
      invoice = Invoice.new(customer_name: nil, service: 'something', amount: 9.95, date: Date.today)
      expect { invalid.validate }.to raise_error(StandardError)
    end

    it 'should throw an error for an Invoice missing the service description' do
      invoice = Invoice.new(customer_name: 'Franz Beckenbauer', service: nil, amount: 9.95, date: Date.today)
      expect { invalid.validate }.to raise_error(StandardError)
    end

    it 'should throw an error for an Invoice missing the amount' do
      invoice = Invoice.new(customer_name: 'Franz Beckenbauer', service: 'something', amount: nil, date: Date.today)
      expect { invalid.validate }.to raise_error(StandardError)
    end

    it 'should throw an error for an Invoice missing the date' do
      invoice = Invoice.new(customer_name: 'Franz Beckenbauer', service: 'something', amount: 9.95, date: nil)
      expect { invalid.validate }.to raise_error(StandardError)
    end
  end

  it 'returns a dummy invoice number' do
    expect(invoice.get_invoice_number).to eq(1)
  end
end
