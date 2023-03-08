# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

roles = Role.create([{ name: "Admin" }, { name: "Student" }])

admin = User.create(email: "admin@test.com", password: "123456", password_confirmation: "123456", role: roles.first)

studentUser = User.create(email: "student1@test.com", password: "123456", password_confirmation: "123456", role: roles.detect { |r| r.name == "Student" })

student = Student.create({ user: studentUser })

courses = Course.create([
  { name: "AWS Basic", description: "Learn AWS from zero" },
  { name: "AWS Advanced", description: "More AWS" },
])

registrations = Registration.create([
  { course: courses.first, student: student },
])
