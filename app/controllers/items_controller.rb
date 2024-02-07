class ItemsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]

  def index
    @items = Item.all
    render :index
  end
  
  def create
    @item = Item.create(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      category: params[:category]
    )
    render :show
  end
  
  def show
    @item = Item.find(params[:id])
    render :show
  end
  
  def update
    @item = Item.find_by(id: params[:id])
    @item.update(
      name: params[:name] || @item.name,
      image_url: params[:image_url] || @item.image_url,
      description: params[:description] || @item.description,
      category: params[:category] ||@item.category
    )
    render :show
  end
  
  def destroy
    item = Item.find_by(id: params[:id])
    if item
      item.destroy
      render json: { message: "Item destroyed successfully" }
    else
      render json: { error: "Item not found" }, status: :not_found
    end
  end

end
  
