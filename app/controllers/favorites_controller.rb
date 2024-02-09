class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @favorites = current_user.favorites.includes(:item)
    render json: @favorites.map { |favorite| favorite.as_json.merge(item: favorite.item.as_json(only: [:id, :name, :description, :category, :image_url]))}
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      render json: @favorite, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end
  
  # def create
  #   @favorite = Favorite.new(favorite_params)
  #   if @favorite.save
  #     render json: @favorite, status: :created
  #   else
  #     render json: favorite.errors, status: :unprocessable_entity
  #   end
  # end

  def show
    @favorite = current_user.favorites.includes(:item).find_by(id: params[:id])
    if @favorite
      render json: @favorite, include: { item: {only: [:id, :name, :description, :category, :image_url]}}
    else
      render json: {error: "Favorite not found"}, status: :not_found
    end
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    if favorite
      favorite.destroy
      render json: { message: "Favorite removed successfully" }
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
  end

  private


  def favorite_params
    params.require(:favorite).permit(:item_id)
  end


  # def favorite_params
  #   params.permit(:item_id, :user_id)
  # end
  
end
