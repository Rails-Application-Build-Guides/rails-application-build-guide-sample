# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = [
  {
    code: 'RA0000001',
    name: 'A製造アルミケースRSDI001',
    name_kana: 'AセイゾウアルミケースRSID001',
    price: 2500,
    purchase_cost: 1200,
    availability: true
  },
  {
    code: 'RA0000002',
    name: 'A製造アルミケースRSDI002',
    name_kana: 'AセイゾウアルミケースRSID002',
    price: 3200,
    purchase_cost: 2000,
    availability: true
  },
  {
    code: 'RB0000001',
    name: 'B製造アルミケースBSD001',
    name_kana: 'AセイゾウアルミケースBSD001',
    price: 900,
    purchase_cost: 800,
    availability: true
  },
  {
    code: 'RX0000179',
    name: 'A電子光沢アルミケース TypeA',
    name_kana: 'Aデンシコウタクアルミケース TypeA',
    price: 9800,
    purchase_cost: 8000,
    availability: false
  },
  {
    code: 'RX0000099',
    name: 'A電子カードホルダ',
    name_kana: 'Aデンシカードホルダ',
    price: 3000,
    purchase_cost: 2500,
    availability: false
  },
]

Product.create(products)
