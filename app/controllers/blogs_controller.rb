class BlogsController < ApplicationController
   before_action :authenticate_user! , only: [:edit, :update, :destroy]
  def home
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    Blog.create(blog_params)
    redirect_to new_blog_path
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content, :image)
  end
end
