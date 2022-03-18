# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Repository.find_or_create_by(
  technology: 'Ruby',
  category: 'Admin Interface',
  full_name: 'activeadmin/activeadmin'
)

Repository.find_or_create_by(
  technology: 'Ruby',
  category: 'Admin Interface',
  full_name: 'activescaffold/active_scaffold'
)

Repository.find_or_create_by(
  technology: 'Ruby',
  category: 'Admin Interface',
  full_name: 'railsadminteam/rails_admin'
)

Repository.find_or_create_by(
  technology: 'Clojure',
  category: 'Web Framework',
  full_name: 'weavejester/compojure'
)

Repository.find_each do |repo|
  SyncRepositoryService.execute(repo)
end
