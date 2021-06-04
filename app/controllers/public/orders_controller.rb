class Public::OrdersController < Public::ApplicationController

  def new
    @neworder = Order.new
    @user = current_end_user
  end

  def confirm
    @cart_items = current_end_user.cart_items.all
    @neworder = Order.new(order_params)
    @neworder.end_user_id = current_end_user.id
    @neworder.shipping_fee = 800
  end

  def create
    @neworder = Order.new(order_params)
    @neworder.save
    redirect_to orders_complete_path
  end

  def complete
  end
  
private

  def order_params
    params.require(:order).permit(:end_user_id, :zip_code, :address, :name, :shipping_fee, :payment_method, :payment)
  end

end
