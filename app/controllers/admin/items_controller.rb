class Admin::ItemsController < Admin::ApplicationController

  def index
    if params[:search].present?
      @items = Item.where('name LIKE ?', "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end

  def new
    @newitem = Item.new
  end
  
  def create
    @newitem = Item.new(item_params)
    @newitem.save
    redirect_to admin_item_path(@newitem)
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :price_without_tax, :introduction, :image, :is_unavailable)
  end
  
end
