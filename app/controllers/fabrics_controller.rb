# frozen_string_literal: true

# FabricsController
#  This controller is responsible for handling the
#  CRUD operations for the fabric entity.
class FabricsController < ApplicationController
  before_action :fabrics, only: %i[index new create]

  def index; end

  def new
    @fabric = Fabric.new
  end

  def create
    @fabric = Fabric.new(fabric_params)

    @fabric.save

    redirect_to fabrics_path
  end

  private

  def fabric_params
    params.require(:fabric)
          .permit(:title, :material, :description, :illustration)
  end

  def fabrics
    @fabrics ||= Fabric.all
  end
end
