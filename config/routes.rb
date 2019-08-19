Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :full_texts do
    resources :text_paragraphs, only: [:index, :show, :done]
  end
end
