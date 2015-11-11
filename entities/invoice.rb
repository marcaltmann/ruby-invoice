class Invoice
  def initialize(customer_name:, service:, amount:, date:)
    @customer_name = customer_name
    @service = service
    @amount = amount
    @date = date
  end

  def validate
    # does nothing yet
  end

  def persist
    # does nothing yet
  end
end
