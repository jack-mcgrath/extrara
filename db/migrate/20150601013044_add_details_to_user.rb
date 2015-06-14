class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :skills, :string
  end
end
