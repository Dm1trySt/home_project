class MetalContentAnalysis < ApplicationRecord
  belongs_to :project

  # Уникальные имена проектов
  def self.unique_project_name
    active_project = []
    all_project =  MetalContentAnalysis.all.order(created_at: :desc)
    all_project.each do |report|
      active_project << report.project_name if report.project.is_active?
    end
    active_project.uniq
  end

  def self.generate_metal_analysis(report)
    #report_data = []
    gold = []
    serebro = []
    platina = []
    data = ""
      data_report = report.gsub(';',', ')
      data_report = data_report[1...-1].split(',').map {|e| e.to_i}
      data_report.each do |meaning|
        case
        when meaning == 91
          serebro << meaning
        when meaning == 88
          gold << meaning
        when meaning == 61
          platina << meaning
        end
      end
    serebro = serebro.size.to_f/100 if serebro.present?
    gold = gold.size.to_f/1000 if gold.present?
    platina = platina.size.to_f/1000 if platina.present?
    serebro = serebro.present? ?  " #{serebro}% - содержания серебра\n" :"0.0% - содержания серебра\n"
    gold = gold.present? ? " #{gold}% - содержания золота\n" : "0.0% - содержания золота\n"
    platina = platina.present? ? " #{platina}% - содержания платины\n" : "0.0% - содержания платины\n"
     "#{serebro}, #{gold}, #{platina}"
  end
end
