require_relative '../control_objects/create_invoice'

describe CreateInvoice do
  it 'should be true' do
    expect(CreateInvoice.new.the_truth).to be true
  end
end
