class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :label, null: false
      t.boolean :active, null: false

      t.timestamps
    end
  end
end
