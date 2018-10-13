class Api::IssuesController < ApplicationController
  def index
    @issues = Issue.includes :reporter, :assignee
    @issues = @issues.where('summary LIKE ?', "%#{params[:summary]}%") if params[:summary].present?
    @issues = @issues.where({reporters: {name: params[:reporter_name]}}) if params[:reporter_name].present?
    @issues = @issues.where({assignees: {name: params[:assignee_name]}}) if params[:assignee_name].present?
    @issues = @issues.paginate(page: params[:page], per_page: params[:page_size]) if params[:page].present? && params[:page_size].present?

    render json: @issues
  end
end
