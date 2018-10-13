FactoryBot.define do
  factory :issue, class: Issue do
    summary { Faker::Book.title }
    status { :pending }
    association :reporter, factory: :user
    association :assignee, factory: :user
  end
end
