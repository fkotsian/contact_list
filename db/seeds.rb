# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


alby = User.create!(username: "emc2")
curie = User.create!(username: "ladycurie")
eddie = User.create!(username: "suckiteddie")
nik = User.create!(username: "tesla4tw")


c1 = Contact.create!(user_id: alby.id,
                name: 'Albert Einstein',
                email: 'physics1@belllabs.com')
c2 = Contact.create!(user_id: curie.id,
                name: 'Marie Curie',
                email: 'radioactive@nobel.org')
c3 = Contact.create!(user_id: eddie.id,
                name: 'Thomas Edison',
                email: 'flashy@lighteningpants.com')
c4 = Contact.create!(user_id: nik.id,
                name: 'Nikola Tesla',
                email: '<secret>')

ContactShare.create!(contact_id: c1.id, user_id: curie.id)
ContactShare.create!(contact_id: c3.id, user_id: curie.id)
ContactShare.create!(contact_id: c4.id, user_id: curie.id)
ContactShare.create!(contact_id: c1.id, user_id: eddie.id)
ContactShare.create!(contact_id: c3.id, user_id: alby.id)