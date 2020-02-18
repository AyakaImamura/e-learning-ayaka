class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :words #カテゴリは複数のwordsを持つ
end
