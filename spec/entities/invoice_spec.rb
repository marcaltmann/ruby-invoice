require 'spec_helper'
require 'entities/invoice.rb'

describe Invoice do
  let(:invoice) do
    Invoice.new(customer_name: 'Franz Beckenbauer', service: 'something', amount: 9.95,
                date: Date.today)
  end

  it 'can create a new invoice' do
    invoice
  end

  it 'can validate an invoice' do
    invoice.validate
  end

  it 'can persist an invoice' do
    invoice.persist
  end
end
