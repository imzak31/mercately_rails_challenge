FactoryBot.define do
  factory :user do
    email { 'email@email.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
