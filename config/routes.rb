Rails.application.routes.draw do
  get '/api' => 'w3_client_api/client_api#index', as: :client_api
end
