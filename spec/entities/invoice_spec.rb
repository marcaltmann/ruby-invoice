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
      expect { invoice.validate }.to raise_error(StandardError)
    end

    it 'should store a single error in an array' do
      invoice = Invoice.new(customer_name: nil, service: 'something', amount: 9.95, date: Date.today)
      expect { invoice.validate }.to raise_error(StandardError)

      expect(invoice.get_errors).to eq(['customer_name must be present'])
    end

    it 'should collect multiple errors in an array' do
      invoice = Invoice.new(customer_name: nil, service: nil, amount: nil, date: nil)
      expect { invoice.validate }.to raise_error(StandardError)

      expect(invoice.get_errors).to eq(['customer_name must be present', 'service must be present',
                                        'amount must be present', 'date must be present'])
    end
  end

  describe 'error handling' do
    it 'returns an empty array for a valid Invoice' do
      expect(invoice.get_errors).to eq([])
    end
  end

  it 'returns a dummy invoice number' do
    expect(invoice.get_invoice_number).to eq(1)
  end
end
