class FavoritesController < ApplicationController
  
  def index
    @favorites = current_user.favorites
    render json: @favorites
  end

  def create
    favorite = current_user.favorites.build(favorite_params)
    if favorite.save
      render json: favorite, status: :created
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  def show
    favorite = current_user.favorites.find_by(id: params[:id])
    render json: favorite
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
  
end
