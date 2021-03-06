class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.order("id DESC")
    @categories = current_user.categories
  end

  # GET /bookmarks/category_filter/1
  def category_filter
    @bookmarks = Bookmark.where("category_id = ?", params[:id]).order("id DESC")
    # @bookmarks = current_user.bookmarks
    @categories = current_user.categories
    # @categories = Category.all
    @active_id = params[:id].to_i
    render :index
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.category
       @category_title = @bookmark.category.title
    end
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
    @category = Category.new
    generate_category_list
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    generate_category_list
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    # respond_to do |format|
      if @bookmark.save
        redirect_to @bookmark, :notice => 'ブックマークを作成しました'
        # format.html { redirect_to @bookmark, notice: 'ブックマークを作成しました' }
        # format.json { render action: 'show', status: :created, location: @bookmark }
      else
        render :action => 'new'
        # format.html { render action: 'new' }
        # format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: '更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :category_id)
    end

    def generate_category_list
      @categories = Category.find(:all, :order => "title")
    end
end
