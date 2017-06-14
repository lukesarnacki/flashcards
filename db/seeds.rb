# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'Jan Kowalski', screen_name: 'janek', email: 'jan@example.com', password: 'secret')
deck = Deck.create!(name: 'Animals', front_language: 'en', back_language: 'pl', user: user)
deck.cards.create(front_text: 'Dog', back_text: 'Pies', deck: deck, status: '')
deck.cards.create(front_text: 'Cat', back_text: 'Kot', deck: deck, status: '')
deck.cards.create(front_text: 'Parrot', back_text: 'Papuga', deck: deck, status: '')
deck.cards.create(front_text: 'Cow', back_text: 'Krowa', deck: deck, status: '')
deck.cards.create(front_text: 'Hamster', back_text: 'Chomik', deck: deck, status: '')

deck = Deck.create!(name: 'Feelings', front_language: 'en', back_language: 'pl', user: user)
deck.cards.create(front_text: 'Love', back_text: 'Kochać', deck: deck, status: '')
deck.cards.create(front_text: 'Hate', back_text: 'Nienawidzić', deck: deck, status: '')
deck.cards.create(front_text: 'Like', back_text: 'Lubić', deck: deck, status: '')
deck.cards.create(front_text: 'Care', back_text: 'Troszczyć się', deck: deck, status: '')
