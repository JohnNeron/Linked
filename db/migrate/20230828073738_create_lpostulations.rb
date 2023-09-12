class CreateLpostulations < ActiveRecord::Migration[7.0]
  def change
    create_table :lpostulations do |t|
      t.string :kind
      t.references :luser, null: false, foreign_key: true
      t.references :lpost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
