# frozen_string_literal: true

class StepSetSubscription < ApplicationRecord
  belongs_to :step_set, optional: true
end
