Rails.application.routes.draw do
  resources :lposts
  devise_for :lusers
  get 'home/index'

  scope '/admin' do
    resources :lusers, :controller => 'lusers'
  end

  devise_scope :luser do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/lpostulations', to: 'lpostulations#luser_lpostulation', as: 'luser_lpostulation'
  get '/my_lpostulations', to: 'lpostulations#lpost_lpostulations', as: 'my_lpostulations'
  # Defines the root path route ("/")
  root "home#index"
end
