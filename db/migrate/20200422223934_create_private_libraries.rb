class CreatePrivateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_libraries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
