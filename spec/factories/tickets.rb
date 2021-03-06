FactoryBot.define do
  factory :ticket do
    name { "Example ticket" }
    description { "An example ticket, nothing more" }
    association :project, strategy: :build
    association :author, factory: :user, strategy: :build
  end
end
