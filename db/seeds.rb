# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
UserListener.destroy_all

Echo.destroy_all
EchoListener.destroy_all

amelie = User.create(first_name: "Amelie", last_name: "Oller", email: "amelie.oller@flatironschool.com")
hal = User.create(first_name: "Hal", last_name: "Dunn", email: "hal.dunn@flatironschool.com")
alec = User.create(first_name: "Alec", last_name: "DuBois", email: "after.alec@gmail.com")
zana = User.create(first_name: "Zana", last_name: "Hertica", email: "zhertica@gmail.com")
brad = User.create(first_name: "Brad", last_name: "Beggs", email: "brad.beggs@gmail.com")
akiko = User.create(first_name: "Akiko", last_name: "Green", email: "agreen17@mail.ccsf.edu")
daniel = User.create(first_name: "Daniel", last_name: "Patnode", email: "dbpatnode@hotmail.com")
danira = User.create(first_name: "Danira", last_name: "Cortez", email: "cortezd334@yahoo.com")
nathan = User.create(first_name: "Nathan", last_name: "Chung", email: "chung.nathanh@gmail.com")
ronak = User.create(first_name: "Ronak", last_name: "Soni", email: "ronakvsoni@gmail.com")
brandon = User.create(first_name: "Brandon", last_name: "Backer", email: "btbacker@gmail.com")
don = User.create(first_name: "Don", last_name: "Mallory", email: "dmm333@gmail.com")

amelie.listeners << hal
amelie.listeners << alec
amelie.listeners << zana
amelie.listeners << brad
amelie.listeners << akiko
amelie.listeners << daniel
amelie.listeners << danira
amelie.listeners << nathan
amelie.listeners << ronak
amelie.listeners << brandon
amelie.listeners << don

hal.listeners << amelie
alec.listeners << amelie
zana.listeners << amelie
brad.listeners << amelie
akiko.listeners << amelie
daniel.listeners << amelie
danira.listeners << amelie
nathan.listeners << amelie
ronak.listeners << amelie
brandon.listeners << amelie
don.listeners << amelie

hal_echo = Echo.create(user: hal, message: "Amelie’s comprehensive knowledge of the course material is surpassed only by her natural talent in conveying it to the students")
hal_echo.listeners << amelie

alec_echo = Echo.create(user: alec, message: "")
alec_echo.listeners << amelie

zana_echo = Echo.create(user: zana, message: "")
zana_echo.listeners << amelie

brad_echo = Echo.create(user: brad, message: "Amelie is able to clearly and simply explain the why, they how, the what, and the when.")
brad_echo.listeners << amelie

akiko_echo = Echo.create(user: akiko, message: "Amelie is a great instructor because she is thorough in her lectures. She has great patience and is always going above and beyond to make sure we as students are learning the material as best as we can")
akiko_echo.listeners << amelie

daniel_echo = Echo.create(user: daniel, message: "Amelie is always willing to lend a hand when needed, very informative and gives structured guidance without just giving the answer.")
daniel_echo.listeners << amelie

danira_echo = Echo.create(user: danira, message: "")
danira_echo.listeners << amelie

nathan_echo = Echo.create(user: nathan, message: "Amelie is a great instructor who cares about her students' success. It's so apparent that she knows her stuff and her love of Javascript is quite contagious. She's a bright and patient with us and continually guides us to do our best.")
nathan_echo.listeners << amelie

ronak_echo = Echo.create(user: ronak, message: "Amelie explains each concept of software engineering with in-depth knowledges. her way of approach to teaching students which is very appropriate for better understanding. Moreover, she is very polite nature and giving more ideas and techniques which helps students to enhancing their knowledge.")
ronak_echo.listeners << amelie

brandon_echo = Echo.create(user: brandon, message: "Amelie is always willing to spend a little extra time with a student answering questions and going over anything that may be unclear. She explains concepts from multiple angles and really seems to have a vested interest in student comprehension. I'm happy to have her as an instructor!")
brandon_echo.listeners << amelie

don_echo = Echo.create(user: don, message: "Amelie is willing to delve into rabbit holes")
don_echo.listeners << amelie
