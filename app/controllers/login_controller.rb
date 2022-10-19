class LoginController < ApplicationController
    skip_before_action :require_login
    def create
        @usuario = Usuario.find_by(email: params[:email])
    
        if !!@usuario && @usuario.authenticate(params[:password])
            session[:usuario_id] = @usuario.id
            redirect_to pagina_inicial_url
        else
            message = "Algo deu errado! Verifique se seu email e senha estão corretos!"
            redirect_to root_url
            flash[:error] = message
        end
    end
    def destroy
        session[:usuario_id] = nil
        redirect_to root_url, notice: "Logged out"
    end
end
