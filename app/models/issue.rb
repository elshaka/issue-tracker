class Issue < ApplicationRecord
  default_scope { joins('INNER JOIN users reporters ON issues.reporter_id = reporters.id').
    joins('INNER JOIN users assignees ON issues.assignee_id = assignees.id') }

  enum status: [:pending, :in_progress, :done]

  belongs_to :reporter, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
end
