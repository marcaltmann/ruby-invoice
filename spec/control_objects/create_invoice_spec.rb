require 'control_objects/create_invoice'

describe CreateInvoice do
  it 'should create a new Invoice entity' do
    dbl = instance_double(Invoice, validate: nil, persist: nil)
    allow(Invoice).to receive(:new).and_return(dbl)

    invoice_creator = CreateInvoice.new(customer_name: 'Franz Beckenbauer', service: 'something',
                                        amount: 9.95, date: Date.today)
    invoice_creator.perform

    expect(dbl).to have_received(:validate)
    expect(dbl).to have_received(:persist)
    expect(invoice_creator.perform).to be true
  end

  it 'should raise an error if Invoice entity is invalid' do
    dbl = instance_double(Invoice, validate: nil, persist: nil)
    allow(Invoice).to receive(:new).and_return(dbl)
    allow(dbl).to receive(:validate).and_raise('not correct')

    invoice_creator = CreateInvoice.new(customer_name: nil, service: nil,
                                        amount: nil, date: nil)
    expect(invoice_creator.perform).to be false
  end
end
