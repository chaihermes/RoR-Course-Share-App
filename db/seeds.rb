# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(
    id: 5, 
    username: "Chaiana Hermes",
    email: "chai2@gmail.com",
    password: "chai1234",
    password_confirmation: "chai1234"
)
user.save!

Course.create!([{
    title: "Curso Teste de Python",
    author: "Chaiana Hermes",
    description: "Esse é um curso básico de Python",
    price: "40",
    image: Rails.root.join("app/assets/images/python.png").open,
    user_id: user.id
},
{
    title: "Curso de JavaScript",
    author: "Chaiana Hermes",
    description: "Esse é um curso básico de JavaScript",
    price: "60",
    image: Rails.root.join("app/assets/images/js.png").open,
    user_id: user.id
},
{
    title: "Curso de Ruby on Rails",
    author: "Chaiana Hermes",
    description: "Esse é um curso básico de Ruby on Rails",
    price: "100",
    image: Rails.root.join("app/assets/images/ruby.jpeg").open,
    user_id: user.id
}])