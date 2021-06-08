class Admin::OrdersController < Admin::ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    params[:order][:status] = params[:order][:status].to_i
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "paid"
      order_details = order.order_details.all
      order_details.update(making_status: 1)
    end
    redirect_to admin_order_path(order)
  end

private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
