class Api::IssuesController < ApplicationController
  def index
    @issues = Issue.all

    @issues = @issues.where('summary LIKE ?', "%#{params[:summary]}%") if params[:summary].present?

    render json: @issues
  end
end
