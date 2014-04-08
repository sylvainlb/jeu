# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fer=ResourceType.create(name:'Iron',volume:'15')
bois=ResourceType.create(name:'Wood',volume:'10')
bouffe=ResourceType.create(name:'Food',volume:'1')
human=ResourceType.create(name:'People',volume:'5')
vehicle=ResourceType.create(name:'Vehicle',volume:'50')

BuildingType.create({name:'Sawmill',cycle_time:'20',resource_type_id:bois.id})
BuildingType.create({name:'Iron Mine',cycle_time:'15',resource_type_id:fer.id})
BuildingType.create({name:'Field',cycle_time:'20',resource_type_id:bouffe.id})
BuildingType.create({name:'City',cycle_time:'500',resource_type_id:human.id})
BuildingType.create({name:'Factory',cycle_time:'1000',resource_type_id:vehicle.id})
