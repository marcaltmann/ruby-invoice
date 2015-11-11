class CreateInvoice
  def initialize(invoice_attributes)
    @invoice_attributes = invoice_attributes
  end

  def perform
    @invoice = Invoice.new(@invoice_attributes)
    begin
      @invoice.validate
      @invoice.persist
      return true
    rescue
      return false
    end
  end
end
