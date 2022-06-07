class MetalContentAnalysisController < ApplicationController
  include ApplicationHelper

  def index
    @project_names = MetalContentAnalysis.unique_project_name
  end

  def show
    @current_project =  Project.find_by_name params[:project_name]
    @data = []
    @metal_content_analysises = MetalContentAnalysis.where(project_name: params[:project_name])
    search_project_by_status
    @all_date = MetalContentAnalysis.where(project_name: params[:project_name]).pluck(:create_date).uniq

    @metal_content_analysises.each do |metal_content_analysis|
      metal_content_analysis.data = MetalContentAnalysis.generate_metal_analysis(metal_content_analysis.data)
    end
  end

  private
  # Поиск проектов по статусу
  def search_project_by_status
    if params[:report_date].present?
      @metal_content_analysises = @metal_content_analysises.where(create_date: params[:report_date])
    end
  end
end
