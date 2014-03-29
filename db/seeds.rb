# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fer=ResourceType.create(name:'Iron')
bois=ResourceType.create(name:'Wood')
bouffe=ResourceType.create(name:'Food')
human=ResourceType.create(name:'People')
vehicle=ResourceType.create(name:'Vehicle')

BuildingType.create({name:'Sawmill',output:'7',resource_type_id:bois.id})
BuildingType.create({name:'Iron Mine',output:'5',resource_type_id:fer.id})
BuildingType.create({name:'Field',output:'7',resource_type_id:bouffe.id})
BuildingType.create({name:'City',output:'2',resource_type_id:human.id})
BuildingType.create({name:'Factory',output:'1',resource_type_id:vehicle.id})

