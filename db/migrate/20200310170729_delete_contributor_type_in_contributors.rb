class DeleteContributorTypeInContributors < ActiveRecord::Migration[6.0]
  def change
  	remove_column :contributors, :contributor_type
  end
end
