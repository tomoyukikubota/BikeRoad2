class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all.order("start_time")
  end
  
  def new
    @blog = Blog.new
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blogs_path
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
