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

  # here we need some validation tests!!
  it 'valid invoice should be validated' do
    invoice.validate
  end

  it 'invalid invoice validation should throw an error' do
    expect { invalid_invoice.validate }.to raise_error
  end
end
