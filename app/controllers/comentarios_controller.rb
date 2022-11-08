class ComentariosController < ApplicationController
    skip_before_action :require_login
    before_action :set_comentario, only: %i[ show edit update destroy ]

    def index
        @comentarios = Comentario.all
    end

    def new
        @comentario = Comentario.new
    end
    
    def create
        @posts_publicos = Post.find(params[:post_id])
        @comentario = @posts_publicos.comentario.new(comentario_params)

        if @comentario.save
            redirect_to "/posts_publicos/#{@posts_publicos.id}"
            flash[:notice] = "Comentário criado com sucesso"
        else
            redirect_to "/posts_publicos/#{@posts_publicos.id}"
            flash[:error] = "Não foi possivel criar seu comentário!"
        end
    end

    private

    def set_comentario
        @comentario = Comentario.find(params[:id])
    end

    def comentario_params
        params.require(:comentario).permit(:post_id, :nome, :mensagem, :parent_id)
    end
end
