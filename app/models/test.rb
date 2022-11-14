class Test < ApplicationRecord
  def self.tests_titles_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category })
        .order('categories.title DESC')
        .pluck('tests.title')
  end
end
