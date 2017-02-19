class FavoriteGifsController < ApplicationController
  def index
    @user = current_user
    @favorite_gifs = FavoriteGif.all
  end

  def new

  end

  def create
    @user = current_user
    @gif = Gif.find(params[:gif_id])
    @favorite_gif = FavoriteGif.new(user_id: @user.id, gif_id: params[:gif_id])
    if @favorite_gif.save
      redirect_to favorite_gifs_path(@user)
    else
      redirect_to gifs_path
    end
  end

  def destroy
    @favorite_gif = FavoriteGif.find(params[:id])
    @favorite_gif.destroy
    redirect_to user_path(current_user)
  end

end
