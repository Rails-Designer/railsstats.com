Rails.application.routes.draw do
  root to: "projects#index"

  resources :projects, only: %w[show]
  resources :snapshots, only: %w[new create edit update]

  get "/sitemap.xml", to: "sitemaps#index", as: :sitemaps

  get "up" => "rails/health#show", as: :rails_health_check
end
