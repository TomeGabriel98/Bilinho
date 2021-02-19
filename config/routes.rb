Rails.application.routes.draw do
  resources :universities, only: %i[create show]
  controller :universities do
    post 'universities/new', action: :create, controller: 'universities'
    get 'universities/show', action: :show, controller: 'universities'
  end

  resources :students, only: %i[create show]
  controller :students do
    post 'students/new', action: :create, controller: 'students'
    get 'students/show', action: :show, controller: 'students'
  end

  resources :enrollments, only: %i[create show]
  controller :enrollments do
    post 'enrollments/new', action: :create, controller: 'enrollments'
    get 'enrollments/show', action: :show, controller: 'enrollments'
  end

  resources :invoices, only: %i[show]
  controller :invoices do
    get 'invoices/:id', action: :show, controller: 'invoices'
  end
end
