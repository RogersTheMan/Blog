class RegisterController < ApplicationController
    def index
        @usuarios = Usuario.all
    end
end
