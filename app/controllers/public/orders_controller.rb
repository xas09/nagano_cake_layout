class Public::OrdersController < Public::ApplicationController
  before_action :ensure_status, except: [:complete]

  def new
    @neworder = Order.new
    @user = current_end_user
  end

  def confirm
    @cart_items = current_end_user.cart_items.all
    params[:order][:payment_method] = (params[:order][:payment_method]).to_i
    @neworder = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @neworder.zip_code = current_end_user.zip_code
      @neworder.address = current_end_user.address
      @neworder.name = current_end_user.first_name+current_end_user.last_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @neworder.zip_code = @address.zip_code
      @neworder.address = @address.address
      @neworder.name = @address.name
    elsif params[:order][:address_option] == "2"
      @neworder.zip_code = params[:order][:zip_code]
      @neworder.address = params[:order][:address]
      @neworder.name = params[:order][:name]
    end
  end

  def create
    @neworder = Order.new(order_params)
    @neworder.save
    cart_items = current_end_user.cart_items.all
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @neworder.id
      order_detail.item_id = cart_item.item_id
      order_detail.price_with_tax = 1.1*cart_item.item.price_without_tax
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

private

  def ensure_status
    if current_end_user.cart_items.present? == false
      redirect_to items_path
    end
  end

  def order_params
    params.require(:order).permit(:end_user_id, :zip_code, :address, :name, :shipping_fee, :payment_method, :payment)
  end

end
