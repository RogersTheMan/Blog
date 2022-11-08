Rails.application.routes.draw do
  resources :usuarios
  resources :posts
  resources :comentarios
  delete "logout", to: "login#destroy"
  get "posts" => "posts#index"
  get "pagina_inicial" => "pagina_inicial#index"
  get "posts_publicos" => "posts_publico#index"
  get "posts_publicos/:id" => "posts_publico#show"
  get "/contact" => "posts_publico#contact"
  get "/about" => "posts_publico#about"
  get "/post_aleatorio" => "posts_publico#post_aleatorio"
  get "/busca" => "posts_publico#busca", as: :busca_post
  get "/todos_posts" => "posts_publico#todos"
  get "/login", to: 'login#index'
  post "/login", to: 'login#create'
  resources :posts do
    resources :comentarios
    member do
      post :hide
    end
  end
  root "login#index"
end
