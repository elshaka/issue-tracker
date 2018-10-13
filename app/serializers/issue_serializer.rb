class IssueSerializer < ActiveModel::Serializer
  attributes :id, :summary, :status
  belongs_to :reporter, serializer: UserSerializer
  belongs_to :assignee, serializer: UserSerializer
end
