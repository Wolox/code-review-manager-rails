class CreateProjectsAndTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :projects_technologies do |t|
      t.belongs_to :project
      t.belongs_to :technology
    end
  end
end
