require 'control_objects/create_invoice'

describe CreateInvoice do
  let(:dbl) { instance_double(Invoice, validate: nil, persist: nil) }
  let(:output) { double(OutputObject, success: nil, failure: nil) }

  it 'should create a new Invoice entity' do
    allow(Invoice).to receive(:new).and_return(dbl)

    invoice_creator = CreateInvoice.new(output,
                                        customer_name: 'Franz Beckenbauer', service: 'something',
                                        amount: 9.95, date: Date.today)
    invoice_creator.perform

    expect(dbl).to have_received(:persist)
  end

  it 'should raise an error if Invoice entity is invalid' do
    allow(Invoice).to receive(:new).and_return(dbl)
    allow(dbl).to receive(:validate).and_raise('not correct')

    invoice_creator = CreateInvoice.new(output,
                                        customer_name: nil, service: nil,
                                        amount: nil, date: nil)
    invoice_creator.perform
  end
end
