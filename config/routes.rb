Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'empleados#home'
  get 'calculadora', to: 'utilitarios#calculadora'
  get 'conversor', to: 'utilitarios#conversor'
  resources :empleados
  get 'nomina', to: 'empleados#nomina'
  get 'api/v1/empleados', to: 'api/v1/empleados#index', defaults: { format: :json }
  get 'api/v1/nomina', to: 'api/v1/nomina#index', defaults: { format: :json }
end
