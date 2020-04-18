class Merchant::DiscountsController < ApplicationController

  def show
    @discount = Discount.find(params[:discount_id])
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
