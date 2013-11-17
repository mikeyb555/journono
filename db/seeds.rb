# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Site.create(name: 'The Courier Mail', url: 'http://feeds.news.com.au/public/rss/2.0/bcm_top_stories_257.xml', module_class: 0, last_scan: 100, content_container: '.story-body')
