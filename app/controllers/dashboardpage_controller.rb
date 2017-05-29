class DashboardpageController < ApplicationController
  
  layout false
  
  # before_action :must_login, only: [:show]

  def index
  end
  
  def insert
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.account_id = current_authcon.id;

    tmp_image_name = (current_authcon.id).to_s + (Time.now.strftime("%d%m%Y%H%M%S")).to_s

    if @blog_post.image[0] == 'd'
      image_name = tmp_image_name + 1.to_s
      out_file = File.new("savedimages/" + image_name, "w")
      out_file.puts(@blog_post.image)
      out_file.close
      @blog_post.image = image_name
    end

    if @blog_post.image1[0] == 'd'
      image_name = tmp_image_name + 2.to_s
      out_file = File.new("savedimages/" + image_name, "w")
      out_file.puts(@blog_post.image1)
      out_file.close
      @blog_post.image1 = image_name
    end

    if @blog_post.image2[0] == 'd'
      image_name = tmp_image_name + 3.to_s
      out_file = File.new("savedimages/" + image_name, "w")
      out_file.puts(@blog_post.image2)
      out_file.close
      @blog_post.image2 = image_name
    end

    @blog_post.save
    
    redirect_to dashboardpage_blog_post_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :description, :detail, :image, :image1, :image2)
  end
end