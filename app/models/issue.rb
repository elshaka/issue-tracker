class Issue < ApplicationRecord
  enum status: [:pending, :in_progress, :done]
  belongs_to :reporter, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
end
