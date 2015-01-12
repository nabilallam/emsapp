FactoryGirl.define do
  factory :consumption, class: 'Consumption' do
    association :resource
    association :customer
    association :use_sector
    name "consumption_name"
    co2_factor 1.5
    amount 10.5
    association :location
  end

  factory :resource, class: 'Resource' do
    name 'resource_name'
  end

  factory :use_sector, class: 'UseSector' do
    name 'use_sector_name'
    association :customer
  end

  factory :location, class: 'Location' do
    name 'location_name'
  end
end
