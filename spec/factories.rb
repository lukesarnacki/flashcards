FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "john@example.com"
    screen_name "John Doe"
    password "secret"
  end

  factory :card do
    front_text 'Dog'
    back_text 'Pies'
    deck
  end

  factory :deck do
    name 'Animals / Zwierzeta'
    user
  end
end
