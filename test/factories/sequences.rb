FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :date do |n|
    Date.today + n.days
  end
end
