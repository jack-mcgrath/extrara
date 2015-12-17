class AddAvatarToProjects < ActiveRecord::Migration
  def change
  end
  def self.up
      add_attachment :projects, :avatar
  end
  
  def self.down
    remove_attachment :projects, :avatar
  end
end
