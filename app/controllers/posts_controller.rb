class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :all_posts, only: [:index]

	def index
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
	end

	private

	def find_post
		@post = Post.where('id = ?, franchise_id = ?', params[:id], controller.current_franchise)
	end

	def all_posts
		@posts = Post.where(franchise_id: current_franchise)
	end

	def post_params
		params.require(:post).permit(:name,:body,:user_id).merge(franchise_id: current_franchise)
	end


end
