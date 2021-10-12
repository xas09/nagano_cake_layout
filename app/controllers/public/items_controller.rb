class Public::ItemsController < Public::ApplicationController
  skip_before_action :authenticate_end_user!, only: [:index]

  def index
    if params[:search].present?
      @items = Item.where(genre_id: params[:search])
    else
      @items = Item.all
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @new_cart_item = CartItem.new
  end

end
