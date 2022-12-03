# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


categories = Category.all

if !categories.any? { |c| c.name == "Work"}
    Category.create(name: "Work")
end
if !categories.any? { |c| c.name == "Personal"}
    Category.create(name: "Personal")
end
if !categories.any? { |c| c.name == "House"}
    Category.create(name: "House")
end

tasks = Task.all

if !tasks.any? { |t| t.name == "Project 1"}
    Task.create(name: "Project 1", details: "Presentation of final draft", due_date: "27 Nov 2022 11:28:56")
end
if !tasks.any? { |t| t.name == "Groceries"}
    Task.create(name: "Groceries", details: "Buy for next week", due_date: "40 Nov 2022 03:57:43")
end

#Task.create(name: "Project 1", details: "Present Project 1 to the core", due_date: "27 Nov 2022 11:28:56", category: categories.first)