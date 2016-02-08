# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer = Customer.create(name: 'seed_customer')
user = User.create(email: 'seed@user.org', customer_id: customer.id, password: '12345678', password_confirmation: '12345678')
manager  = Manager.create(email: 'manager.seed@user.org', customer_id: customer.id, password: '12345678', password_confirmation: '12345678')

berlin = Location.create(name: 'Standort Berlin', customer_id: customer.id)
abteilung = Location.create(name: 'Abteilung Wartung', customer_id: customer.id)
verkauf = Location.create(name: 'Verkauf', customer_id: customer.id)
halle = Location.create(name: 'Betriebshalle Ost', customer_id: customer.id)
potsdam = Location.create(name: 'Standor Potsdam', customer_id: customer.id)
#---------------------------------------

use_sector_strom = UseSector.create(name: 'Strom')
use_sector_waerme = UseSector.create(name: 'Wärme')

gruenstrom = Resource.create(name: 'Grünstrom', unit: 'kWh')
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: gruenstrom.id, use_sector_id: use_sector_strom.id)
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: gruenstrom.id, use_sector_id: use_sector_strom.id)

strom_netz = Resource.create(name: 'Stromnetz DE', unit: 'kWh')
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: strom_netz.id, use_sector_id: use_sector_strom.id)

gas = Resource.create(name: 'Gas', unit: 'L')
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: gas.id, use_sector_id: use_sector_waerme.id)

district_heating = Resource.create(name: 'Fernwärme', unit: 'kWh')
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: district_heating.id, use_sector_id: use_sector_waerme.id)

brown_coald = Resource.create(name: 'Braun Kohle', unit: 'kg')
CustomerResourcesUseSector.create(customer_id: customer.id, resource_id: brown_coald.id, use_sector_id: use_sector_waerme.id)

#------------------------------------------

[berlin, abteilung, verkauf, halle, potsdam].each_with_index do |location, i|
  values = {effective_date: DateTime.current - (10 - i).day, location_id: location.id}
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_strom.id, resource_id: gruenstrom.id, name: 'Verbrauch 1', amount: 111.11 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_strom.id, resource_id: gruenstrom.id, name: 'Verbrauch 2', amount: 222.22 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_strom.id, resource_id: strom_netz.id, name: 'Verbrauch 1', amount: 23.11 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_strom.id, resource_id: strom_netz.id, name: 'Verbrauch 3', amount: 434 * i}.merge(values))
end

[berlin, abteilung, verkauf, halle, potsdam].each_with_index do |location, i|
  values = {effective_date: DateTime.current - (10 - i).day, location_id: location.id}
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: gas.id, name: 'Gas Verbrauch 3', amount: 433.33 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: gas.id, name: 'Gas Verbrauch 5', amount: 353.33 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: district_heating.id, name: 'Zentralwärme 6', amount: 433.33 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: district_heating.id, name: 'Zentralwärme 5', amount: 36.33 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: brown_coald.id, name: 'braun verbrauch 6', amount: 733.33 * i}.merge(values))
  Consumption.create({customer_id: customer.id, use_sector_id: use_sector_waerme.id, resource_id: brown_coald.id, name: 'braun nicht son 5', amount: 376.33 * i}.merge(values))
end
