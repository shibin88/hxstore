class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

    def index
       @orders = current_user.orders.order("id DESC")
    end
def new

end
    def pay_with_alipay
        @order = Order.find_by_token(params[:id])
        @order.set_payment_with!("alipay")
        @order.make_payment!

        redirect_to new_order_path(), notice: "使用微信成功完成付款"
      end

      def pay_with_wechat
        @order = Order.find_by_token(params[:id])
        @order.set_payment_with!("wechat")
        @order.make_payment!

        redirect_to order_path(@order.token), notice: "使用微信成功完成付款"
      end
end
