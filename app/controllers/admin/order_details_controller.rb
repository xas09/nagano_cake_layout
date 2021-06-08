class Admin::OrderDetailsController < Admin::ApplicationController

  def update
    params[:order_detail][:making_status] = params[:order_detail][:making_status].to_i
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order = Order.find(order_detail.order_id)
    if order_detail.making_status == "making"
        order.update(status: 2)
    end
    order_details = order.order_details.all
    if order_details.where(making_status: "done").count == order_details.count
        order.update(status: 3)
    end
    redirect_to admin_order_path(order)
  end

  private

   def order_detail_params
     params.require(:order_detail).permit(:making_status)
   end

end
