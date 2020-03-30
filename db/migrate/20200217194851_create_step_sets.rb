class CreateStepSets < ActiveRecord::Migration[6.0]
  def change
    create_table :step_sets do |t|
      t.timestamps
    end
  end
end
