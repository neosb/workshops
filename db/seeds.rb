# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['creative category', 'lulz', 'rails girls', 'linux vs mac', 'cloud', 'blood-thirsty hummingbirds'].each do |category|
  Category.create!(name: category)
end

o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
['mail@mail.com', 'myemail@mydomain.com', 'user@example.com', 'server@bot.com', 'girl@hot.com'].each do |email|
  string = (0...8).map { o[rand(o.length)] }.join
  if email == 'girl@hot.com'
    User.create!(email: email, password: 'try_me', password_confirmation: 'try_me', firstname: string, lastname: string.reverse, admin: true)
  else
    User.create!(email: email, password: '123', password_confirmation: '123', firstname: string, lastname: string.reverse)
  end
end

20.times do
  string = (0...8).map { o[rand(o.length)] }.join
  longer_string = (0...400).map { o[rand(o.length)] }.join
  Product.create!(title: string, description: longer_string.gsub('e', ' '), price: rand(100.0).round(2), category_id: rand(1..6), user_id: 5)
end

10.times do
  string = (0...200).map { o[rand(o.length)] }.join
  Review.create!(content: string.gsub('e', ' '), rating: rand(1..100), product_id: rand(1..20), user_id: rand(1..4))
end
