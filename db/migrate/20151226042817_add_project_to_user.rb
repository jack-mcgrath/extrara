class AddProjectToUser < ActiveRecord::Migration
    def change
        add_column :users, :project, :integer
    end
end