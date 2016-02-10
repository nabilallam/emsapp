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

  factory :use_sector do
    sequence(:name){|n| "use_sector_#{n}" }
  end

  factory :resource do
    sequence(:name){|n| "resource_#{n}" }
    unit 'kWh'
  end

  factory :consumption do
    customer
    use_sector
    resource
    location
    sequence(:name){|n| "consumption_#{n}"}
    amount 1
    effective_date Date.current
  end

  factory :location do
    name 'location'
    customer
  end
end
