# class Orders::CreateNewOrderController
#
module Orders
  # Create new controller for the create new order command
  class CreateNewOrderController < ApplicationController
    include Devise::Controllers::Helpers

    before_action :authenticate_user!

    def create
      @order = Order.new(order_params.merge(customer_id: params[:customer_id],
                                            fabric_id: params[:fabric_id],
                                            workroom_id: params[:workroom_id],
                                            product_id: params[:product_id]))

      if @order.save
        redirect_to @order
      else
        @errors = @order.errors
        puts @errors
        render :new, status: :unprocessable_entity
      end
    end

    private

    def order_params
      @order_params ||=
        params.require(:order)
              .permit(Order.new.attributes.keys.map(&:to_sym))
    end
  end
end
