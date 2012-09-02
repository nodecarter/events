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
    resource 'SessionsController' do
      privilege :destroy
    end
    resource 'Account::WelcomeController' do
      privilege :index
    end
    resource 'Account::UsersController' do
      privilege :edit
      privilege :update
      privilege :destroy
    end
    resource 'EventsController' do
      privilege :index
    end
    resource 'Account::EventsController' do
      privilege :index
      privilege :new
      privilege :create
      privilege :edit
      privilege :update
      privilege :destroy
    end
  end

  resources :guest do
    resource 'WelcomeController' do
      privilege :index
    end
    resource 'UsersController' do
      privilege :new
      privilege :create
    end
    resource 'SessionsController' do
      privilege :new
      privilege :create
    end
  end
end
