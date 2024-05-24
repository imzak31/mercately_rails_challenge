FactoryBot.define do
  factory :order do
    association :user

    trait :cart do
      state { 'cart' }
    end

    trait :completed do
      state { 'completed' }
    end

    trait :removed do
      state { 'removed' }
    end
  end
end
