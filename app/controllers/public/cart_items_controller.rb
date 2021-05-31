class Public::CartItemsController < Public::ApplicationController
  
  def index
    user = current_end_user
    @cart_items = user.cart_items.all
  end
  
  def create
    if (current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? == true )
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.update(amount: @cart_item.amount += (params[:cart_item][:amount]).to_i)
      redirect_to cart_items_path
    else
      @new_cart_item = CartItem.new(cart_item_params)
      @new_cart_item.end_user_id = current_end_user.id
      @new_cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    user = current_end_user
    cart_items = user.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end

end
