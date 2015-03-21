class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @categories = Category.all
    # @categories = Category.where("id LIKE ?", "%#{params[:id]}%")
    @categories = current_user.categories
    # @user = User.all 
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    # @category.save
      if @category.save
        # redirect_to @category, :notice => 'カテゴリーを作成しました'
        redirect_to @category
      else
        render :action => 'new' 
      end
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:user_id, :title)
    end
end
