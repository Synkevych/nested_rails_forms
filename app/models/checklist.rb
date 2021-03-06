class Checklist < ApplicationRecord
  # Checklist can have many questions and when delete a checklist
  # the question that belongs to the specific checklist will be deleted as well. 
  has_many :questions, dependent: :destroy
  has_many :audits, dependent: :destroy
  
  validates :title, presence: true, length: { in: 1..40 }, uniqueness: true
  validates :description, presence: true
  validates :public, default: false

  # Set up the number of displayed Checklist items per page
  self.per_page = 10
  
  # @return [Integer] sum of all questions in the current list
  def count_questions
    questions.count
  end

  scope :published, -> { where(public: true) }

end
