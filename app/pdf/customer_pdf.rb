class CustomerPdf < Prawn::Document
  def initialize(customer)
  	super()
  	@customer = customer

  	customer_text
  	end


  	def customer_text
  		text  "Customer id: #{@customer.id}
             idx: #{@customer.idx}
             nickname: #{@customer.nickname}
             created_at: #{@customer.created_at}"
    end
end
