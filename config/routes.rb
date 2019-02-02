Rails.application.routes.draw do
  resources :categories, except: [:new, :edit] # <- Esta es la línea que añadimos
  resources :login, except: [:new, :edit] # <- Esta es la línea que añadimos
end
