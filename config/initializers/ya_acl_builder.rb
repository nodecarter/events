YaAcl::Builder.build do
  roles do
    role :user
    role :guest
  end

  resources :user do
    resource 'WelcomeController' do
      privilege :index
    end
    resource 'UsersController' do
      privilege :show
    end
  end

  resources :guest do
    resource 'WelcomeController' do
      privilege :index
    end
    resource 'UsersController' do
      privilege :new
      privilege :create
      privilege :show
    end
  end
end
