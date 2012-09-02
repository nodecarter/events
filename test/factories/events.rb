FactoryGirl.define do
  factory :event do
    name { FactoryGirl.generate(:string) }
    date { FactoryGirl.generate(:date) }
    recurrent Event::ONCE
  end

  factory :week_event, parent: :event do
    recurrent Event::WEEKLY
    until_date 1.year.from_now
  end
end
