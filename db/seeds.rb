5.times do
  Restaurant.create({name: Faker::Lorem.word, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: ["chinese", "italian", "japanese", "french", "belgian"].sample})
end