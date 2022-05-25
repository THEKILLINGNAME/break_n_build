# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: "adminn@adminn.com", password: "adminn", admin: true)
User.create!(email: "111111@gmail.com", password: "111111", admin: true)
User.create!(email: "oleggg@oleg.com", password: "oleggg", admin: true)

unknown_brand = Brand.create!(name: "Unknown Brand")
foo_brand = Brand.create!(name: "Foo Brand")
bar_brand = Brand.create!(name: "Bar Brand")
super_brand = Brand.create!(name: "Super Brand")
mega_brand = Brand.create!(name: "MEGA Brand")
big_brand = Brand.create!(name: "Big Brand")
small_brand = Brand.create!(name: "Small Brand")

Product.create!(
  title: "ДрельДрельДрель",
  description: "Текст о дрели Текст о дрели Текст о дрели Текст о дрели Текст о дрели",
  brand: unknown_brand,
  price: 65433,
  stock: true,
  drill_stat: DrillStat.create!(
    power_type: "Сеть",
    power: "123",
    capacity: "321"
  ),
  category: "drills"
)
Product.create!(
  title: "ШуруповёртШуруповёртШуруповёрт",
  description: "Текст о шуруповёрте Текст о шуруповёрте Текст о шуруповёрте Текст о шуруповёрте Текст о шуруповёрте",
  brand: foo_brand,
  price: 86743,
  stock: false,
  screwdriver_stat: ScrewdriverStat.create!(
    power_type: "Аккум.",
    power: "333",
    rounds_per_min: "22"
  ),
  category: "screwdrivers"
)
Product.create!(
  title: "АккумуляторАккумуляторАккумулятор",
  description: "Текст о аккумуляторе Текст о аккумуляторе Текст о аккумуляторе Текст о аккумуляторе Текст о аккумуляторе",
  brand: bar_brand,
  price: 12345,
  stock: true,
  charger_stat: ChargerStat.create!(
    capacity: "5324",
    output_voltage: "5126",
    type_of_charge: "AF/22"
  ),
  category: "chargers"
)
Product.create!(
  title: "ПерфораторПерфораторПерфоратор",
  description: "Текст о перфораторе Текст о перфораторе Текст о перфораторе Текст о перфораторе Текст о перфораторе Текст о перфораторе",
  brand: super_brand,
  price: 75646,
  stock: true,
  perforator_stat: PerforatorStat.create!(
    power: "123",
    rounds_per_min: "123",
    strokes_per_min: "22",
    catrtridge_type: "SS/2",
    drilling_diameter: "5×2"
  ),
  category: "perforators"
)
Product.create!(
  title: "БитаШуруповёртаБитаШуруповёртаБитаШуруповёрта",
  description: "Текст о бите шуруповерта Текст о бите шуруповерта Текст о бите шуруповерта Текст о бите шуруповерта",
  brand: small_brand,
  price: 5000,
  stock: true,
  screwdriver_bit_stat: ScrewdriverBitStat.create!(
    length: "20",
    size: "5",
    shlitz_type: "тип2"
  ),
  category: "screwdriver_bits"
)
Product.create!(
  title: "БурПерфоратораБурПерфоратораБурПерфоратора",
  description: "Текст о буре перфоратора Текст о буре перфоратора Текст о буре перфоратора Текст о буре перфоратора",
  brand: big_brand,
  price: 6000,
  stock: false,
  perforator_bit_stat: PerforatorBitStat.create!(
    diametr: "8",
    length: "30",
    cartridge_type: "тип2"
  ),
  category: "perforator_bits"
)
