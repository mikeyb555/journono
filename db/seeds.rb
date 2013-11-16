# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Site.create(name: 'Gizmodo', url: 'http://feeds.gizmodo.com.au/GizmodoAustralia', module_class: 0, last_scan: 100)
