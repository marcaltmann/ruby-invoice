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
    @invoice = Invoice.new(customer_name: @customer_name, service: @service,
                           amount: @amount, date: @date)
    begin
      @invoice.validate
      @invoice.persist
      @output_object.success('toll')
    rescue
      @output_object.failure('nicht so toll')
    end
  end
end
