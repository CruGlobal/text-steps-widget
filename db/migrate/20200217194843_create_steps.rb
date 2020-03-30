class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :body
      t.string :help_text
      t.references :step_set
      t.timestamps
    end
  end
end
