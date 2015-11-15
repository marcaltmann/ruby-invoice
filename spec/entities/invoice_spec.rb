require 'errors'
require 'entities/invoice'

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
      expect { invoice.validate }.to raise_error(ValidationError)
    end

    it 'should store a single error in an array' do
      invoice = Invoice.new(customer_name: nil, service: 'something', amount: 9.95, date: Date.today)
      expect { invoice.validate }.to raise_error(ValidationError)

      expect(invoice.get_errors).to eq(['customer_name must be present'])
    end

    it 'should collect multiple errors in an array' do
      invoice = Invoice.new(customer_name: nil, service: nil, amount: nil, date: nil)
      expect { invoice.validate }.to raise_error(ValidationError)

      expect(invoice.get_errors).to eq(['customer_name must be present', 'service must be present',
                                        'amount must be present', 'date must be present'])
    end
  end

  describe 'error handling' do
    it 'returns an empty array for a valid Invoice' do
      expect(invoice.get_errors).to eq([])
    end
  end

  describe 'number' do
    it 'returns an invoice number for an invoice' do
      dbl = instance_double(InvoiceNumber, to_s: '001')
      allow(InvoiceNumber).to receive(:new).and_return(dbl)

      expect(invoice.get_invoice_number.to_s).to eq('001')
    end

    it 'generates only one invoice number for an invoice' do
      allow(InvoiceNumber).to receive(:new).and_return(true)

      3.times { invoice.get_invoice_number }

      expect(InvoiceNumber).to have_received(:new).once
    end
  end
end
