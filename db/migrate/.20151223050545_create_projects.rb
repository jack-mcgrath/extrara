class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :des
      t.string :sub
      t.string :s1
      t.string :s2
      t.string :s3

      t.timestamps
    end
  end
end
