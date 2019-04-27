# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Satellite.destroy_all

Satellite.create(name: 'Center Floater')
Satellite.create(
  name: 'Off Center Floater',
  pos_x: 100,
  pos_y: 100,
  pos_z: 100
)
Satellite.create(
  name: 'Mover',
  vel_x: 1,
  vel_y: 1,
  vel_z: -1
)
Satellite.create(
  name: 'Thruster',
  thrust_x: 1,
  thrust_y: 1,
  thrust_z: -1
)
