class CreateJobAssignations < ActiveRecord::Migration[6.0]
  def change
    create_table :job_assignations do |t|
    	t.belongs_to :role, null: false
    	t.belongs_to :contributor, null: false
    end
  end
end
