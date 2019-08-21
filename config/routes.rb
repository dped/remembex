Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :full_texts do
    resources :text_paragraphs, only: [:index, :show, :done]
  end
  resources :game_sessions, only: [:show]
  post 'game_sessions/:id/update', to: 'game_sessions#update', as: :update_game_session
  post 'game_sessions/:id/guess_word', to: 'game_sessions#guess_word', as: :guess_word
end
