FactoryGirl.define do
  factory :customer, class: 'Customer' do
    name 'customer_name'
  end

  factory :user, class: 'User' do
    email 'user@email.de'
    customer
    password 'password'
    password_confirmation 'password'
  end

  factory :manager do
    email 'manager@email.de'
    customer
    password 'password'
    password_confirmation 'password'
  end
end
