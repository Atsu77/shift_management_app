class CreateSubject < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.boolean :japanese, null: false, default: false
      t.boolean :society, null: false, default: false
      t.boolean :math, null: false, default: false
      t.boolean :science, null: false, default: false
      t.boolean :english, null: false, default: false

      t.timestamps
    end
  end
end
