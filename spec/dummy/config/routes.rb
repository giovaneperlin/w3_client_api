Rails.application.routes.draw do
  mount W3ClientApi::Engine => "/w3_client_api"
end
