# frozen_string_literal: true

# class TrackingController
class TrackingController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @order = Order.find_by(trello_card_id: params[:id])

    render layout: false
  end
end
