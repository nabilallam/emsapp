FactoryGirl.define do
  factory :customer, class: 'Customer' do
    name 'customer_name'
  end

  factory :user, class: 'User' do
    email 'user@email.de'
    customer_id FactoryGirl.create(:customer, name: 'customer_name').id
    password 'password'
    password_confirmation 'password'
  end
end
