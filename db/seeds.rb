# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

users = []
tests = []
categories = []
answers = []
questions = []

5.times do
  users << User.create!(name: Faker::Name.unique.name)

  tests << Test.create!(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true, random_words_to_add: 5),
                        level: Faker::Number.within(range: 0..5))

  categories << Category.create!(title: Faker::Lorem.unique.sentence(word_count: 1, supplemental: true,
                                                                     random_words_to_add: 3))

  answers << Answer.create!(correct: Faker::Boolean.boolean,
                            body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                               random_words_to_add: 50))

  questions << Question.create!(body: Faker::Lorem.unique.sentence(word_count: 3, supplemental: true,
                                                                   random_words_to_add: 50))
end

tests.each do |test|
  test.update(category_id: categories.sample.id)
end

categories.each do |category|
  category.update(test_id: tests.sample.id)
end

answers.each do |answer|
  answer.update(question_id: questions.sample.id)
end

questions.each do |question|
  question.update(test_id: tests.sample.id)
end
