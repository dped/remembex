Rails.application.routes.draw do
  devise_for :users
  root to: 'full_texts#index'
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
  get 'game_sessions/:id/final_score', to: 'game_sessions#final_score', as: :final_score
  get 'game_sessions/:id/input_count', to: 'game_sessions#input_count', as: :input_count

  get 'dashboard', to: "pages#dashboard"
end
