class CreateProyectsAndTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :proyects_technologies do |t|
      t.belongs_to :proyect
      t.belongs_to :technology
    end
  end
end
