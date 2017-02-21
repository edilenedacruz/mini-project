class FavoriteGifsController < ApplicationController
  before_action :authorize!
  def index
    @user = current_user
    @favorite_gifs = FavoriteGif.all
  end

  def new
    @favorite_gif = FavoriteGif.new
  end

  def create
    @user = current_user
    @gif = Gif.find(params[:gif_id])
    @favorite_gif = FavoriteGif.create(user_id: @user.id, gif_id: params[:gif_id])
    if @favorite_gif.save
      redirect_to user_path(@user)
    end
  end

  def destroy
    @favorite_gif = FavoriteGif.find(params[:id])
    @favorite_gif.destroy
    redirect_to user_path(current_user)
  end

end
