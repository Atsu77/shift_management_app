class AddProfileTeachers < ActiveRecord::Migration[6.1]
  def up
    add_column :teachers, :gender, :integer, default: 0
    add_column :teachers, :address, :string
    add_column :teachers, :number, :string
    add_column :teachers, :profile, :text
  end

  def down
    remove_column :teachers, :gender, :integer, default: 0
    remove_column :teachers, :address, :string 
    remove_column :teachers, :number, :string
    remove_column :teachers, :profile, :text
  end
end
