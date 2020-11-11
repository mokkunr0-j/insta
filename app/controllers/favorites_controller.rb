class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(picture_id: params[:picture_id], user_id: current_user.id)
    redirect_to pictures_path
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    url = request.referer
    redirect_to url
  end
  def index
    if current_user == nil
      redirect_to new_session_path
    else
      @user_favorites = current_user.favorites
    end
  end
end
