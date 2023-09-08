# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Task.destroy_all
Tuto.destroy_all
List.destroy_all
User.destroy_all

User.create!(
  password: '123456',
  name: 'Daddy',
  email: 'daddy@parent.com',
  role: 'parent',
  total_points: 2
)
User.create!(
  password: '123456',
  name: 'Mommy',
  email: 'mommy@parent.com',
  role: 'parent',
  total_points: 3
)

List.create!(
  name: 'Tâches',
  user: User.first
)

Tuto.create!(
  name: 'Aspirateur',
  description: 'Dans le placard dans le couloir.',
  url: 'https://www.youtube.com/watch?v=pYMrXJUAK7I'
)
Tuto.create!(
  name: 'Linge',
  description: 'Ne pas melanger les couleurs',
  url: ''
)

Task.create!(
  name: 'Aspirateur',
  done: false,
  display_tuto: true,
  list: List.first,
  tuto: Tuto.first,
  owner: User.first,
  executor: User.first
)
Task.create!(
  name: 'Linge',
  done: true,
  display_tuto: true,
  tuto: Tuto.last,
  owner: User.last,
  executor: User.first
)
Task.create!(
  name: 'Rendez-vous Pédiatre',
  done: true,
  display_tuto: false,
  list: List.first,
  owner: User.last,
  executor: User.last
)
