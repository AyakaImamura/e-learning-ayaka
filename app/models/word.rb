class Word < ApplicationRecord
  belongs_to :category #ワードはカテゴリに紐づく
  has_many :choices, dependent: :destroy #ワードは複数のchoicesを持つ
  accepts_nested_attributes_for :choices

  validates :content, presence: true
  validates :choices, presence: true
  validate :has_one_correct
  validate :has_unique_choices

  private
    def has_one_correct
      if choices.select {|choice| choice.is_correct == true }.count !=1
        return errors.add :base,"Must have one correct choice"
      end
    end

    def has_unique_choices
      if choices.uniq {|choice| choice.content }.count < choices.length
        return errors.add :base, "Must have unique choices"
      end
    end
end
