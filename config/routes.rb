Rails.application.routes.draw do
  resources :correct_answers
  resources :feedbacks
  resources :student_results
  resources :invitations
  resources :answers
  resources :questions
  resources :assessments
  resources :users

  get 'question_answers', to: 'answers#question_answers'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
