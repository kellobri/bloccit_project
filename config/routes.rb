Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'welcom/contact'

  root to: 'welcome#index' 
end
