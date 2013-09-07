
User.create(name: 'Doktor', email: 'dgurson@gmail.com', password: '123')
User.first.surveys << Survey.create(title: 'Beardiness')

User.first.surveys.first.questions << Question.create(content: 'What is your preferred length?')
User.first.surveys.first.questions.first.choices << Choice.create(reply: 'short')
User.first.surveys.first.questions.first.choices << Choice.create(reply: 'medium')
User.first.surveys.first.questions.first.choices << Choice.create(reply: 'burly')

#create associations


