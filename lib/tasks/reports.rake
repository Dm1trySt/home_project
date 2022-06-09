namespace :reports do
  desc "Сбор данных для отчета Анализ металических отходов"
  task metal_data_collection: :environment do
    data = []
    # Поиск всех файлов в директории files
    files_name = Dir.entries("#{Rails.root}/files/").select { |f| File.file? File.join("#{Rails.root}/files/", f) }

    files_name.each do |name|
      # Удаление формата файла из названии файла
      part_and_project_name = File.basename("#{Rails.root}/files/#{name}", ".*").split('.')[0]
      part_name = part_and_project_name.split('|')[0]

      project_name = part_and_project_name.split('|')[1]
      project_id = Project.find_by_name(project_name).id

      # Просмотор содержимого файла
      File.open("#{Rails.root}/files/#{name}", "r") do |f|
        # Перебор каждой строки в файле
        f.each_line do |line|
          data << line
        end
      end
      File.delete("#{Rails.root}/files/#{name}")
      MetalContentAnalysis.create(project_name: project_name, data: data, project_id: project_id,
                               create_date: Date.today, part_name: part_name)
    end
  end
end
