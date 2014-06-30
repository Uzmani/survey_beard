
User.create(name: 'Doktor', email: 'dgurson@gmail.com', password: '123')
20.times { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: '123')}
User.first.created_surveys << Survey.create(title: 'Beardiness')

User.first.created_surveys.first.questions << Question.create(content: 'Who if your favorite bearded person?')
User.first.created_surveys.first.questions.first.choices << Choice.create(reply: 'Doktor')
User.first.created_surveys.first.questions.first.choices << Choice.create(reply: 'Ian')
User.first.created_surveys.first.questions.first.choices << Choice.create(reply: 'Uzman')
User.first.created_surveys.first.questions.first.choices << Choice.create(reply: 'Yosemite Sam')

1.upto(20) {|id| User.find(id).answers << Answer.create(choice_id: rand(1..4))}


