class Invoice
  def initialize(customer_name:, service:, amount:, date:)
    @customer_name = customer_name
    @service = service
    @amount = amount
    @date = date
  end

  def validate
    if @customer_name.nil? ||
      @service.nil? ||
      @amount.nil? ||
      @date.nil?
      raise StandardError.new
    end
  end

  def get_errors
    errors = []
    errors << 'customer_name must be present' if @customer_name.nil?
    errors << 'service must be present' if @service.nil?
    errors << 'amount must be present' if @amount.nil?
    errors << 'date must be present' if @date.nil?
    errors
  end

  def persist
    validate
    # does nothing more yet
  end

  def get_invoice_number
    1
  end
end
