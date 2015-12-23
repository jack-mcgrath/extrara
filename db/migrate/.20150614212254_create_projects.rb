class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.string :des
      t.string :s1
      t.string :s2
      t.string :s3
      t.string :s4
      t.string :s5

      t.timestamps
    end
  end
end
