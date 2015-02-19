Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  devise_for :users
  resources :topics do
    resources :posts, :summary, except: [:index]
  end

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  root to: 'welcome#index' 
end
