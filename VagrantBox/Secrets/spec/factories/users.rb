FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "jdoe@email.com" }
    password { "password" }
    password_confirmation { "password" } 
  end
end
