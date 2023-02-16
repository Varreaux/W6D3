# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

paloma = User.create!(
    username: "awesome_person", 
  )
  
  valerie = User.create!(
    username: "valerous", 
  )
  
  daniel = User.create!(
    username: "dan_the_man", 
  )

  ar1 = Artwork.create!(title: "Title A", image_url: "Please use my messaging app, it's way better than Twitter.", artist_id: daniel.id)
  ar2 = Artwork.create!(title: "Title B", image_url: "Hello fellow instructors.", artist_id: paloma.id)
  ar3 = Artwork.create!(title: "Mona Lisa", image_url: "Have you seen this sweet instructor merch?", artist_id: 1)

  as1 = ArtworkShare.create!(artwork_id: ar1.id, viewer_id: 5)
  as2 = ArtworkShare.create!(artwork_id: ar2.id, viewer_id: 6)
  as3 = ArtworkShare.create!(artwork_id: ar3.id, viewer_id: valerie.id)