class AddAvatarToProjects < ActiveRecord::Migration
    def up
        add_attachment :projects, :avatar
    end
    
    def down
        remove_attachment :projects, :avatar
    end
end