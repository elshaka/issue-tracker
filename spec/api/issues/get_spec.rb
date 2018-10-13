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

  let!(:covfefe_issue) { create :issue, summary: 'Despite the constant negative press covfefe' }
  it 'should search by summary' do
    get '/api/issues?summary=covfefe'

    summaries = response_body.map { |issue| issue[:summary] }

    expect(summaries).to match_array([covfefe_issue.summary])
  end

  after :all do
    User.delete_all
    Issue.delete_all
  end
end
