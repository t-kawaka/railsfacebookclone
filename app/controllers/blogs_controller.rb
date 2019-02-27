class BlogsController < ApplicationController
   before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
   before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
    Blog.create(blog_params)
      redirect_to blogs_path, notice:"ブログを作成しました"
    else
      render 'new'
    end
  end

  
  def confirm
    @blog = Blog.new(blog_params)
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @blog.user_id == current_user.id
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to blogs_path, notice: "ブログを編集しました" }
        else
          format.html { render :edit }
        end
      end
    else
      redirect_to edit_blog_path, notice: "You don't have permission."
    end
  end
  
  def destroy
    if @blog.user_id == current_user.id
    @blog.destroy
      msg = "Blog was successfully destroyed."
    else
      msg = "You don't have permission"
    end
    respond_to do |format|
      format.html { redirect_to blogs_path, notice: msg }
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
