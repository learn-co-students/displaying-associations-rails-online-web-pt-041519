class PostsController < ApplicationController
	before_action :get_post, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@post = Post.create(post_params(:title, :description, :category_id))
		redirect_to post_path(@post)
	end

	def edit
		@categories = Category.all
	end

	def update
		@post.update(post_params(:title, :description, :category_id))
		redirect_to post_path(@post)
	end

	private

	def get_post
		@post = Post.find(params[:id])
	end
	
	def post_params(*args)
		params.require(:post).permit(*args)
	end

end
