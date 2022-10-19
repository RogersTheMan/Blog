class PostsController < ApplicationController
    layout "_layout"
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
        @posts = Post.page(params[:page]).per(5)
    end

    def show
        @post.visit_counter += 1
        @post.save
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_url
            flash[:notice] = "Post salvo com sucesso"
        else
            render :new
        end
    end

    def update
        if @post.update post_params
            flash[:notice] = "Post atualizado com sucesso!"
            redirect_to posts_url
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_url
    end

    def hide
        @post = set_post
        if !@post.hidden
            @post.update_attribute(:hidden, true)
            flash[:notice] = 'Agora esse post não está mais a mostra!'
            redirect_to posts_url
        else
            @post.update_attribute(:hidden, false)
            flash[:notice] = 'Agora este post está a mostra!'
            redirect_to posts_url
        end
      end
    

    private
    def set_post
        @post = Post.find(params[:id])
      end

    def post_params
        params.require(:post).permit :titulo, :corpo, :image, :visit_counter
    end

    def increase_visit
        visit_counter+=1
        save!
    end
end
