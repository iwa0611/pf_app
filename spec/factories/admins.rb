FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "testadmin" }
    password_confirmation { "testadmin" }
  end
end
