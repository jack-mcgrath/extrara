class AddDetailsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :subtitle, :string
    add_column :projects, :des, :string
    add_column :projects, :s1, :string
    add_column :projects, :s2, :string
    add_column :projects, :s3, :string
    add_column :projects, :s4, :string
  end
end
