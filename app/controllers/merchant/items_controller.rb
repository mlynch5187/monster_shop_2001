class Merchant::ItemsController < ApplicationController

  before_action :require_merchant

  def index
    @items = @current_user.merchant.items
  end

  def new
    @item = Item.new
  end

  def create
    @merchant = @current_user.merchant
    @item = @merchant.items.create(item_params)
    if @item.save
      flash[:success] = "#{@item.name} is saved"
      redirect_to "/merchant/items"
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    params[:status] ? status_param_update(params) : item_param_update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    Review.where(item_id: item.id).destroy_all
    flash[:success] = "#{item.name} is now deleted" if item.destroy
    redirect_to "/merchant/items"
  end

  private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end

  def item_param_update(item_params)
    @item.update(item_params)
    if @item.save
      flash[:success] = "#{@item.name} is updated"
      redirect_to "/merchant/items"
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render :edit
    end
  end

  def status_param_update(params)
    update = params[:status] == "activate" ? true : false
    @item.update(:active? => update)
    if @item.save
        flash[:success] = "#{@item.name} is now available for sale" if update
        flash[:success] = "#{@item.name} is no longer for sale" if !update
        redirect_to "/merchant/items"
    end
  end
end
