FactoryBot.define do
  factory :comment do
    comment { "Test Comments" }
    user { nil }
    message { nil }
  end
end
