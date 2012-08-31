FactoryGirl.define do
  factory :user do
    email { FactoryGirl.generate(:email) }
    password "password"
    password_confirmation "password"
    full_name { FactoryGirl.generate(:string) }
  end
end
