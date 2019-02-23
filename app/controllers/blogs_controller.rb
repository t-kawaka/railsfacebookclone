class BlogsController < ApplicationController
   before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
   before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def home
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params)
    if @blog.save
    Blog.create(blog_params)
      redirect_to new_blog_path, notice:"ブログを作成しました"
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました"
  end
  
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
