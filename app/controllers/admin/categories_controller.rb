class Admin::CategoriesController < Admin::BaseController
  before_action :authorize!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:sucess] = "A new category has been created!"
        redirect_to admin_categories_path
      else
        flash.now[:notice] = "Please re-enter the category name with just one word"
        render :new
      end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
