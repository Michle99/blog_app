require 'kramdown'
class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token

    # GET /posts
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    # GET /posts/1
    def show
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
        @post = Post.new(post_params)
            if @post.save
                redirect_to posts_path(@post), notice: "Post was successfully created."
            else
                render :new
            end
    end

    # PATCH/PUT /posts/1
    def update 
            if @post.update(post_params)
                redirect_to posts_path(@post), notice: "Post was successfully updated."
            else
                render :edit
            end
    end

    # DELETe /posts/1
    def destroy
        @post.destroy
            redirect_to posts_path, notice: "Post was successfully destroyed."
    end

    # Use callbacks to share common setup or constraints between actions.
    private
        def set_post
            @post = Post.find(params[:id])
        end

     # Only allow a list of trusted parameters through.
        def post_params
            params.require(:post).permit(:title, :description)
        end
    end