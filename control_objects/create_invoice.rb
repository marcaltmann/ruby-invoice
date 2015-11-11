require_relative '../entities/invoice'

class CreateInvoice
  def initialize(output_object, invoice_attributes)
    @output_object = output_object
    @invoice_attributes = invoice_attributes
  end

  def perform
    @invoice = Invoice.new(@invoice_attributes)
    begin
      @invoice.validate
      @invoice.persist
      @output_object.success('toll')
    rescue
      @output_object.failure('nicht so toll')
    end
  end
end
