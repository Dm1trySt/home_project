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
        when meaning = 91
          serebro << meaning
        when meaning = 88
          gold << meaning
        when meaning = 61
          platina << meaning
        end
        serebro = serebro.size.to_f/1000
        serebro = "#{serebro}% - содержания серебра\n"
        gold = gold.size.to_f/10000
        gold = "#{gold}% - содержания золота\n"
        platina = platina.size.to_f/10000
        platina = "#{platina}% - содержания платины\n"
      end

     data = "#{serebro}, #{gold}, #{platina}"
  end
end
