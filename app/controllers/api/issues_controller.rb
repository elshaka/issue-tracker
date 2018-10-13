class Api::IssuesController < ApplicationController
  def index
    @issues = Issue.includes :reporter, :assignee
    @issues = @issues.where('summary LIKE ?', "%#{params[:summary]}%") if params[:summary].present?
    @issues = @issues.where({reporters: {name: params[:reporter_name]}}) if params[:reporter_name].present?
    @issues = @issues.where({assignees: {name: params[:assignee_name]}}) if params[:assignee_name].present?

    render json: @issues
  end
end
