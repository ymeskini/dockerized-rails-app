Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'new' => 'games#new'
  post 'score' => 'games#score'

  # new GET  /new(.:format)   games#new
  # score POST /score(.:format) games#score
end
