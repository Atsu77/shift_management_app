class CreateSpecialty < ActiveRecord::Migration[6.1]
  def change
    create_table :specialties do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
