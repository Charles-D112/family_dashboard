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

daddy = User.create!(
  password: '123456',
  name: 'Daddy',
  email: 'daddy@parent.com',
  role: 'parent',
  total_points: 0
)
mommy = User.create!(
  password: '123456',
  name: 'Mommy',
  email: 'mommy@parent.com',
  role: 'parent',
  total_points: 0
)
lea = User.create!(
  password: '123456',
  name: 'Léa',
  email: 'lea@kid.com',
  role: 'enfant',
  total_points: 0
)
nico = User.create!(
  password: '123456',
  name: 'Nico',
  email: 'nico@kid.com',
  role: 'enfant',
  total_points: 0
)

List.create!(
  name: 'Tâches',
  user: daddy
)

aspirateur = Tuto.create!(
  name: 'Aspirateur',
  description: 'Dans le placard dans le couloir.',
  url: 'https://www.youtube.com/watch?v=pYMrXJUAK7I'
)
linge = Tuto.create!(
  name: 'Linge',
  description: 'Ne pas melanger les couleurs',
  url: ''
)

Task.create!(
  name: 'Aspirateur',
  done: false,
  display_tuto: true,
  list: List.first,
  tuto: aspirateur,
  owner: daddy,
  executor: daddy
)
Task.create!(
  name: 'Linge',
  done: true,
  display_tuto: true,
  tuto: linge,
  owner: mommy,
  executor: daddy
)
Task.create!(
  name: 'Révision voiture',
  done: true,
  display_tuto: false,
  owner: mommy,
  executor: daddy
)
Task.create!(
  name: 'Rendez-vous Pédiatre',
  done: true,
  display_tuto: false,
  list: List.first,
  owner: mommy,
  executor: mommy
)

Task.create!(
  name: 'Sortir le chien',
  done: true,
  display_tuto: true,
  owner: daddy,
  executor: nico
)
Task.create!(
  name: 'Mettre la table',
  done: true,
  display_tuto: true,
  owner: mommy,
  executor: lea
)
Task.create!(
  name: 'Ranger sa chambre',
  done: true,
  display_tuto: false,
  owner: mommy,
  executor: nico
)
Task.create!(
  name: 'Debarasser la table',
  done: true,
  display_tuto: false,
  list: List.first,
  owner: mommy,
  executor: nico
)
