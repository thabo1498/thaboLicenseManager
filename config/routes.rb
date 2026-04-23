Rails.application.routes.draw do
  root "licenses#index"

  resources :licenses, param: :app_name do
    collection do
      post :send_expiry_emails
    end
  end
end
