FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :string do |n|
    "string#{n}"
  end
end
