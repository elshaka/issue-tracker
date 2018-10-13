require 'rails_helper'

describe 'GET /api/issues' do
  before :all do
    create_list :issue, 50
  end

  it 'should retrieve all issues' do
    get '/api/issues'

    summaries = response_body.map { |issue| issue[:summary] }

    expect(summaries).to match_array(Issue.all.map(&:summary))
  end

  after :all do
    User.delete_all
    Issue.delete_all
  end
end
