# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.reset_pk_sequence
Dispatch.delete_all
Dispatch.reset_pk_sequence
Comment.delete_all
Comment.reset_pk_sequence

felix = User.create(username: "felix" , email: "felix@example.com", password: "12345678", password_confirmation: "12345678", age: Faker::Number.number(digits: 2), location: Faker::Address.city)
dell = User.create(username: "dell" , email: "dell@example.com", password: "12345678", password_confirmation: "12345678", age: Faker::Number.number(digits: 2), location: Faker::Address.city)
jack = User.create(username: "jack" , email: "jack@example.com", password: "12345678", password_confirmation: "12345678", age: Faker::Number.number(digits: 2), location: Faker::Address.city)
rei = User.create(username: "rei" , email: "rei@example.com", password: "12345678", password_confirmation: "12345678", age: Faker::Number.number(digits: 2), location: Faker::Address.city)

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, user_id: Faker::Number.between(from: 1, to: 4))
end

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, url: "https://example.com", user_id: Faker::Number.between(from: 1, to: 4))
end

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, user_id: Faker::Number.between(from: 1, to: 4))
end

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, url: "https://example.com", user_id: Faker::Number.between(from: 1, to: 4))
end

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, user_id: Faker::Number.between(from: 1, to: 4))
end

2.times do
    Dispatch.create(title: Faker::Movies::VForVendetta.quote, description: Faker::Hacker.say_something_smart, url: "https://example.com", user_id: Faker::Number.between(from: 1, to: 4))
end

25.times do
    Comment.create(message: Faker::Movies::Departed.quote, user_id: Faker::Number.between(from: 1, to: 4), dispatch_id: Faker::Number.between(from: 1, to: 10))
end

puts "Seeded database"

# Faker::Movies::Departed.quote
# Faker::Hacker.say_something_smart
