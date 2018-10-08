Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'shortened_links#index'
  get "/:short_url", to: 'shortened_links#show'
  get "shortened/:short_url", to: 'shortened_links#shortened', as: :shortened
  post "/shortened_links/create"
end
