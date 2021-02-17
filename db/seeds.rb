# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(
  username: "aaronparisi",
  password: "password"
)

user2 = User.new(
  username: "kelseyjones",
  password: "password"
)

user1.save
user2.save

todo1 = Todo.new(
  title: "Wash Car",
  body: "with soap",
  dueAt: DateTime.now,
  user_id: user1.id
)

todo2 = Todo.new(
  title: "Wash Dog",
  body: "with shampoo",
  dueAt: DateTime.now,
  user_id: user2.id
)

todo1.save
todo2.save

todo1Step1 = Step.new(
  title: "pour soap and water into bucket",
  row_order_position: :last,
  todo_id: todo1.id
)

todo1Step2 = Step.new(
  title: "soak sponge and lather car",
  row_order_position: :last,
  todo_id: todo1.id
)

todo1Step3 = Step.new(
  title: "rinse car with water from hose",
  row_order_position: :last,
  todo_id: todo1.id
)

todo2Step1 = Step.new(
  title: "coax dog into tub with treats",
  row_order_position: :last,
  todo_id: todo2.id
)

todo2Step2 = Step.new(
  title: "wash dog",
  row_order_position: :last,
  todo_id: todo2.id
)

todo1Step1.save
todo1Step2.save
todo1Step3.save
todo2Step1.save
todo2Step2.save