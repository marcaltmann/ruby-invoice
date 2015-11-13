require_relative '../entities/invoice'

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
      create_and_persist_invoice
    rescue
      handle_error
    end
  end

  private

  def create_and_persist_invoice
    @invoice = Invoice.new(customer_name: @customer_name, service: @service,
                           amount: @amount, date: @date)
    @invoice.persist
    @output_object.success('toll')
  end

  def handle_error
    @output_object.failure('nicht so toll')
  end
end
