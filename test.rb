require_relative 'output_object'
require_relative 'control_objects/create_invoice'

output = OutputObject.new
creator = CreateInvoice.new(output, { customer_name: '', service: '', amount: 0, date: '' } )
creator.perform

creator = CreateInvoice.new(output, { customer_name: '', service: '', amount: 0, date: '' } )
creator.perform
