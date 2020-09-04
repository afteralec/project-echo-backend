# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

alec = User.create(first_name: "Alec", last_name: "DuBois", email: "after.alec@gmail.com")
alec_clist = ContactList.create(user: alec)

zana = User.create(first_name: "Zana", last_name: "Hertica", email: "zhertica@gmail.com")
zana_clist = ContactList.create(user: zana)

ContactEntry.create(contact_list: alec_clist, contact: zana)
ContactEntry.create(contact_list: zana_clist, contact: alec)
