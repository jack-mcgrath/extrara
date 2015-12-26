class AddProjectToUser < ActiveRecord::Migration
  def change
    add_column :users, :project, :has_many
  end
end
