# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create(idx:'1', nickname: 'Sveta')
Customer.create(idx:'2', nickname: 'Masha')

Address.create(customer_id:'1',country_id:'1',city_id:'1',street: 'Lenina',tag: '22')
Address.create(customer_id:'2',country_id:'2',city_id:'2',street: 'Novaya',tag: '122')

City.create(name: 'Moskov', country_id: '1')
City.create(name: 'Minsk', country_id: '2')

ContactType.create(name: 'Sales')
ContactType.create(name: 'Sale')

Contact.create(customer_id:'1',contact_type_id:'1',value:'some value')
Contact.create(customer_id:'2',contact_type_id:'2',value:'some value')

Country.create(name:'Russia')
Country.create(name:'Belarus')

CustomerMeasure.create(measure_id:'1',customer_id:'1', value:'some value')
CustomerMeasure.create(measure_id:'1',customer_id:'2', value:'some value')

Fabric.create(title: 'Krasnaya Vesna')
Fabric.create(title: 'Vympel')

Measure.create(tag:'point_1')
Measure.create(tag:'point_2')

Order.create(idx:'1',customer_id:'1',purchased_at:'Time.now',product_id:'1',fabric_id:'1',comment:'some comment',aasm_state: 'true')
Order.create(idx:'2',customer_id:'2',purchased_at:'Time.now-1',product_id:'2',fabric_id:'2',comment:'some comment',aasm_state: 'false')

ProductPrice.create(value:'20$',tag:'tag',product_id:'1')
ProductPrice.create(value:'30$',tag:'ag',product_id:'2')

Product.create(idx:'1',name:'Morkva')
Product.create(idx:'2',name:'Litle black dress')

Taylor.create(name:'Gor',meta:'some meta')
Taylor.create(name:'Krush',meta:'some meta')
