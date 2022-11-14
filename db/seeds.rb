# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

ITERATIONS = 5

ITERATIONS.times do
  User.create(name: Faker::Name.unique.name)

  category = Category.create!(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true,
                                                                  random_words_to_add: 3))

  test = Test.create(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true, random_words_to_add: ITERATIONS),
                     level: Faker::Number.within(range: 0..5),
                     category_id: category.id)

  question = Question.create(body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                                random_words_to_add: 50),
                             test_id: test.id)

  Answer.create(correct: Faker::Boolean.boolean,
                body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                   random_words_to_add: 50),
                question_id: question.id)
end
