products = [
  {
    id: 1,
    code: 'RA0000001',
    name: 'A製造アルミケースRSDI001',
    name_kana: 'AセイゾウアルミケースRSID001',
    price: 2500,
    purchase_cost: 1200,
    availability: true
  },
  {
    id: 2,
    code: 'RA0000002',
    name: 'A製造アルミケースRSDI002',
    name_kana: 'AセイゾウアルミケースRSID002',
    price: 3200,
    purchase_cost: 2000,
    availability: true
  },
  {
    id: 3,
    code: 'RB0000001',
    name: 'B製造アルミケースBSD001',
    name_kana: 'AセイゾウアルミケースBSD001',
    price: 900,
    purchase_cost: 800,
    availability: true
  },
  {
    id: 4,
    code: 'RX0000179',
    name: 'A電子光沢アルミケース TypeA',
    name_kana: 'Aデンシコウタクアルミケース TypeA',
    price: 9800,
    purchase_cost: 8000,
    availability: false
  },
  {
    id: 5,
    code: 'RX0000099',
    name: 'A電子カードホルダ',
    name_kana: 'Aデンシカードホルダ',
    price: 3000,
    purchase_cost: 2500,
    availability: false
  },
]

Product.create(products)

categories = [
  {
    id: 1,
    name: '機械部品'
  },
  {
    id: 2,
    name: '電子部品'
  },
  {
    id: 3,
    name: '素材・材料'
  }
]

Category.create(categories)

product_categories = [
  {
    product_id: 1,
    category_id: 1
  },
  {
    product_id: 1,
    category_id: 3
  },
  {
    product_id: 2,
    category_id: 1
  },
  {
    product_id: 2,
    category_id: 3
  },
  {
    product_id: 3,
    category_id: 1
  },
  {
    product_id: 3,
    category_id: 3
  },
  {
    product_id: 4,
    category_id: 1
  },
  {
    product_id: 4,
    category_id: 3
  },
  {
    product_id: 5,
    category_id: 1
  },
  {
    product_id: 5,
    category_id: 3
  }
]

ProductCategory.create(product_categories)
