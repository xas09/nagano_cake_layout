class Public::ItemsController < Public::ApplicationController
  skip_before_action :authenticate_end_user!, only: [:index]

  def index
    @items = Item.all
  end

  def show
  end
end
