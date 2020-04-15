# frozen_string_literal: true

class CreateStepSetSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :step_set_subscriptions do |t|
      t.string :execution_sid, null: false
      t.string :status, null: false, default: "pending"
      t.references :step_set
      t.timestamps
    end
  end
end
