require 'rails_helper'

RSpec.describe Answer, type: :model do
  
  let (:checklist) { build(:checklist) }
  let (:question) { build(:question, checklist: checklist) }
  let (:audit) { build(:audit, checklist: checklist) }
  let (:answer) { build(:answer, question_id: question.id, audit: audit) }

  it 'has a valid factory' do
    expect(answer).to be_valid
  end
  
  describe 'associations' do
    it { is_expected.to belong_to(:audit) }
  end

  describe 'validations' do
    context 'name' do
      it { is_expected.to have_db_column(:answer).of_type(:string) }
      it { is_expected.to validate_length_of(:comment).is_at_least(12) }
    end
  end

end
