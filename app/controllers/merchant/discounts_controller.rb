class Merchant::DiscountsController < ApplicationController

  def new; end

  def show
    @discount = Discount.find(params[:discount_id])
  end

  def create
    # require "pry"; binding.pry
    @merchant = current_user.merchant

    discount = @merchant.discounts.create(discount_params)
    if discount.save
      redirect_to "/merchant"
      flash[:success] = "#{discount.name} has been created!"
    else
      flash[:error] = discount.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @discount = Discount.find(params[:discount_id])
  end

  def update
    @discount = Discount.find(params[:discount_id])
    @discount.update(discount_params)
    if @discount.save
      redirect_to "/merchant/discounts/#{@discount.id}"
    else
      flash[:error] = @discount.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    discount = Discount.find(params[:discount_id])
    discount.destroy
    flash[:success] = "#{discount.name} has been deleted" if discount.destroy
    redirect_to "/merchant"
  end

  def discount_params
    params.permit(:name, :percentage, :bulk, :description)
  end
end
