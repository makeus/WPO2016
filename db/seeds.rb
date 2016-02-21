# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

style1 = Style.create name:"Lager", description: "Lager (German: storeroom or warehouse) is a type of beer that is conditioned at low temperatures, normally in cold storage at the brewery, before being delivered to the consumer. It may be pale, golden, amber, or dark."
style2 = Style.create name:"Pale Ale", description: "Pale ale is a beer made by warm fermentation using predominantly pale malt."
style3 = Style.create name:"Porter", description: "Porter is a dark style of beer developed in London from well-hopped beers made from brown malt. The name was first recorded in the 18th century, and is thought to come from its popularity with street and river porters"
style4 = Style.create name:"Weizen"

b1.beers.create name:"Iso 3", style:style1
b1.beers.create name:"Karhu", style:style1
b1.beers.create name:"Tuplahumala", style:style1
b2.beers.create name:"Huvila Pale Ale", style:style2
b2.beers.create name:"X Porter", style:style3
b3.beers.create name:"Hefeweizen", style:style4
b3.beers.create name:"Helles", style:style1