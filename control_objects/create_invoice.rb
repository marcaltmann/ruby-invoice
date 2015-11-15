require_relative '../entities/invoice'
require_relative '../errors.rb'

class CreateInvoice
  def initialize(output_object, customer_name:, service:, amount:, date:)
    @output_object = output_object
    @customer_name = customer_name
    @service = service
    @amount = amount
    @date = date
  end

  def perform
    begin
      create_invoice
    rescue ValidationError
      handle_error
    end
  end

  private

  def create_invoice
    @invoice = Invoice.new(customer_name: @customer_name, service: @service,
                           amount: @amount, date: @date)
    @invoice.persist
    invoice_number = @invoice.get_invoice_number.to_s
    @output_object.success(invoice_number)
  end

  def handle_error
    @output_object.failure(@invoice.get_errors)
  end
end
