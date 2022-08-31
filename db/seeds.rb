# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

ITERATIONS = 5

users = []
tests = []
categories = []
answers = []
questions = []

ITERATIONS.times do
  users << User.create(name: Faker::Name.unique.name)

  tests << Test.create(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true, random_words_to_add: ITERATIONS),
                       level: Faker::Number.within(range: 0..5),
                       category_id: Faker::Number.within(range: 1..ITERATIONS))

  categories << Category.create!(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true,
                                                                     random_words_to_add: 3),
                                 test_id: Faker::Number.within(range: 1..ITERATIONS))

  answers << Answer.create(correct: Faker::Boolean.boolean,
                           body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                              random_words_to_add: 50),
                           question_id: Faker::Number.within(range: 1..ITERATIONS))

  questions << Question.create(body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                                  random_words_to_add: 50),
                               test_id: Faker::Number.within(range: 1..ITERATIONS))
end
