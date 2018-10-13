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

  let!(:test_reporter) { create :user, name: 'Test Reporter' }
  let!(:test_assignee) { create :user, name: 'Test Assignee' }
  let!(:test_issue) { create :issue, reporter: test_reporter, assignee: test_assignee }

  it 'should search by reporter name' do
    get '/api/issues?reporter_name=Test%20Reporter'

    reporter_names = response_body.map { |issue| issue[:reporter][:name] }.uniq

    expect(reporter_names).to match_array([test_reporter.name])
  end

  it 'should search by asginee name' do
    get '/api/issues?assignee_name=Test%20Assignee'

    assignee_names = response_body.map { |issue| issue[:assignee][:name] }.uniq

    expect(assignee_names).to match_array([test_assignee.name])
  end

  after :all do
    User.delete_all
    Issue.delete_all
  end
end

