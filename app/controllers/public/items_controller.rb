class Public::ItemsController < Public::ApplicationController
  skip_before_action :authenticate_end_user, only: [:index]

  def index
  end

  def show
  end
end
