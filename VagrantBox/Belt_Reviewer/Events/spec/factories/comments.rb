FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    event { nil }
    user { nil }
  end
end
