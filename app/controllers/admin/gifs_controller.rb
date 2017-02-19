class Admin::GifsController < Admin::BaseController
  require 'giphy'

  def index
      @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @category = Category.find_or_create_by(title: gif_params[:title])
    @gif = Gif.new(title: gif_params[:title], image_path: Giphy.random(gif_params[:title]).image_url.to_s, category_id: @category.id)
      if @gif.save
        flash[:success] = "Gif created!"
        redirect_to admin_gifs_path
      else
        flash.now[:notice] = "This category already exist. Please choose another."
        render :new
      end
  end

  private

  def gif_params
    params.require(:gif).permit(:title, :image_path, :category_id)
  end
end
