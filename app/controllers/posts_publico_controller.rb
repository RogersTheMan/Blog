class PostsPublicoController < ApplicationController
    layout "_layoutpublico"
    skip_before_action :require_login
    before_action :set_post_publico, only: %i[ show edit update destroy ]
    before_action :posts_recentes, only: %i[ show contact index about busca todos ]
    before_action :posts_famosos, only: %i[ show contact index about busca todos ]
    before_action :post_aleatorio, only: %i[ show contact index about busca todos ]
    before_action :todos_posts, only: %i[ show contact index about busca todos ]

    def index
        @posts_publicos = Post.all
        @posts_publicos_slide = Post.where(:id => random_ids(4))
        @post_publicos_barra = Post.where(:id => random_ids(4))
        @post_publicos_principal = Post.order(visit_counter: :desc).limit(1)
    end

    def show
        @posts_publicos.visit_counter += 1
        @posts_publicos.save
    end
    
    def todos
    end

    def contacts
    end

    def post_aleatorio
    end

    def busca
        @titulo_a_buscar = params[:titulo]
        @posts_buscados = Post.page(params[:page]).per(5).where "titulo like ?", "%#{@titulo_a_buscar}%"
    end
    
    def about
    end

    private
    def set_post_publico
        @posts_publicos = Post.find(params[:id])
      end

    def post_publicos_params
        params.require(:post).permit :titulo, :corpo, :image, :visit_counter, :created_at
    end

    def random_ids qtd
        p = Post.all
        p.ids.sort_by { rand }.slice(0, qtd)
    end

    def posts_recentes
        @posts_recentes = Post.order(created_at: :desc).limit(5)
    end

    def posts_famosos
        @posts_famosos = Post.order(visit_counter: :desc).limit(5)
    end

    def post_aleatorio
        @post_aleatorio = Post.where(:id => random_ids(1))
    end

    def todos_posts
        @todos_posts = Post.page(params[:page]).per(5)
    end
end
