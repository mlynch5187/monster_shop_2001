class Merchant::DiscountsController < ApplicationController

  def show
    @discount = Discount.find(params[:discount_id])
  end

end
