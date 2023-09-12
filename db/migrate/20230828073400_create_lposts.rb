class CreateLposts < ActiveRecord::Migration[7.0]
  def change
    create_table :lposts do |t|
      t.string :title
      t.string :content
      t.references :luser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
