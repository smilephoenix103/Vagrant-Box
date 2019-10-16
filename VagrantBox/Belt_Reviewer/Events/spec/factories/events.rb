FactoryBot.define do
  factory :event do
    name { "MyString" }
    date { "2019-10-16" }
    city { "MyString" }
    state { "MyString" }
    user { nil }
  end
end
