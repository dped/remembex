Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :full_texts do
    resources :text_paragraphs, only: [:index]
  end
  resources :text_paragraphs, only: [:show]
  patch 'text_paragraphs/:id/mark_as_done', to: 'text_paragraphs#mark_as_done', as: :mark_as_done

  resources :game_sessions, only: [:show]
  post 'text_paragraphs/:text_paragraph_id/game_sessions', to: 'game_sessions#create', as: :create_game_session
  post 'game_sessions/:id/update', to: 'game_sessions#update', as: :update_game_session
  post 'game_sessions/:id/guess_word', to: 'game_sessions#guess_word', as: :guess_word
end
