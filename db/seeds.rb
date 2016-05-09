# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Tip.create! title: "lorem", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In erat mauris, faucibus quis pharetra sit amet, pretium ac libero.", section: "meal"

# Stages
Stage.create! position: 1, from: "Madrid", to: "París",    distance: 1200
Stage.create! position: 2, from: "París", to: "Berlín",  distance: 1000
Stage.create! position: 3, from: "Berlín", to: "Milán", distance: 1000
Stage.create! position: 4, from: "Milán", to: "Kiev",    distance: 1000
Stage.create! position: 5, from: "Kiev", to: "Moscú",     distance: 800

# Users
user1 = User.create! email: "gulliver@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: "Gulliver", birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Canarias", avatar_url: "http://decine21.com/img/upload/Videos/Obras/Los-viajes-de-Gulliver-21497/Los-viajes-de-Gulliver-21497-T2.flv.jpg"
user2 = User.create! email: "forrest@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: "Forrest Gump", birthday: "1985-02-02", genre: "male", weight: 80, height: 190, location: "Canarias", avatar_url: "https://pbs.twimg.com/profile_images/698322888189829121/QRZPJSXg.jpg"
user3 = User.create! email: "dandy@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: "Dundee", birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Canarias", avatar_url: "http://4.bp.blogspot.com/-z27s0gwcelc/U7gpd082XvI/AAAAAAAACac/R5I_xVNIq4s/s1600/8085-4108.gif"
user1.total_distance = 180
user2.total_steps = 16200
user2.total_distance = 180
user3.total_steps = 16200
user3.total_distance = 180
user1.total_steps = 16200
user1.current_stage = Stage.first
user2.current_stage = Stage.first
user3.current_stage = Stage.first
user1.save
user2.save
user3.save

# Meals
user1.meals.create! consumed_at: Date.today-5, cereal: 1, fruit: 1, vegetable: 1, meat: 0, dairy: 1, sweets: 0, fats: 1
user1.meals.create! consumed_at: Date.today-4, cereal: 1, fruit: 0, vegetable: 0, meat: 1, dairy: 1, sweets: 0, fats: 1
user1.meals.create! consumed_at: Date.today-3, cereal: 0, fruit: 1, vegetable: 0, meat: 0, dairy: 1, sweets: 1, fats: 1
user1.meals.create! consumed_at: Date.today-2, cereal: 1, fruit: 1, vegetable: 1, meat: 1, dairy: 0, sweets: 1, fats: 1
user1.meals.create! consumed_at: Date.today-1, cereal: 1, fruit: 0, vegetable: 0, meat: 0, dairy: 0, sweets: 0, fats: 0
user1.meals.create! consumed_at: Date.today,   cereal: 1, fruit: 1, vegetable: 1, meat: 1, dairy: 1, sweets: 0, fats: 0

# Hydratations
user1.hydratations.create! consumed_at: Date.today-5, quantity: 5
user1.hydratations.create! consumed_at: Date.today-4, quantity: 7
user1.hydratations.create! consumed_at: Date.today-3, quantity: 4
user1.hydratations.create! consumed_at: Date.today-2, quantity: 8
user1.hydratations.create! consumed_at: Date.today-1, quantity: 3
user1.hydratations.create! consumed_at: Date.today,   quantity: 8

# Fakers Users
user1 = User.create! email: "test1@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://www.ucar.edu/communications/staffnotes/0304/seth.gif"
user2 = User.create! email: "test2@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "https://www.ucar.edu/communications/staffnotes/0801/images/laidlaw.jpg"
user3 = User.create! email: "test3@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://i.imgur.com/lPBJXJl.png"
user4 = User.create! email: "test4@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://blog.texasbar.com/files/2013/01/Zachary-Oliva1.jpg"
user5 = User.create! email: "test5@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://blog.texasbar.com/files/2013/04/MaryGraceRuden_smaller1.jpg"
user6 = User.create! email: "test6@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "https://i.vimeocdn.com/portrait/9706840_300x300.jpg"
user7 = User.create! email: "test7@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://www.classtools.net/_FAKEBOOK/images/a/antonia.jpg"
user8 = User.create! email: "test8@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://www.ableins.ca/barrie/assets/images/portraits/women/12.jpg"
user9 = User.create! email: "test9@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "https://www.ucar.edu/communications/staffnotes/0602/images/piper.jpg"
user0 = User.create! email: "test10@crocode.mobi", password: "cc03e747a6afbbcbf8be7668acfebee5", name: Faker::Name.name, birthday: "1986-02-02", genre: "male", weight: 76, height: 180, location: "Madrid", avatar_url: "http://orig07.deviantart.net/bac7/f/2014/041/9/a/profile_picture_by_i_am_a_random_person-d75xov8.jpg"
