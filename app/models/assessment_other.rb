class AssessmentOther < ApplicationRecord
  belongs_to :user
  belongs_to :requesteduser, class_name: 'User'

  validates :user_id, presence: true
  validates :requesteduser_id, presence: true
end
