FactoryGirl.define do
  factory :event do
    name { FactoryGirl.generate(:string) }
    date { FactoryGirl.generate(:date) }
    recurrent Event::REC_NONE
  end

  factory :week_event, parent: :event do
    recurrent Event::REC_WEEK
    until_date 1.year.from_now
  end
end
