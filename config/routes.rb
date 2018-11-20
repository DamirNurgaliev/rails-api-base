Rails.application.routes.draw do
  namespace :v1, defaults: { format: "jsonapi" } do
    resource :users, only: %i[create show update destroy]
    resource :tokens, only: %i[create]
  end
end
