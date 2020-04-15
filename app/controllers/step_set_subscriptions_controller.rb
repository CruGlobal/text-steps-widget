# frozen_string_literal: true

class StepSetSubscriptionsController < ApplicationController
  TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:from_number]
  STEP_DESCRIPTION = "Encourage your friend by asking if you can pray for them."

  skip_before_action :verify_authenticity_token, only: [:update]

  def new
    @step_description = step_description
  end

  def create
    resp = create_twilio_session
    StepSetSubscription.create(step_set: step&.step_set, execution_sid: resp.sid)

    redirect_to step_set_subscription_path(1)
  end

  def show
  end

  def update
    sub = StepSetSubscription.find_by(execution_sid: params[:sid])
    sub&.update(status: params[:status])
    render plain: "OK"
  end

  private

  def create_twilio_session
    flow = client.studio.v1.flows(Rails.application.credentials.twilio[:flow_id])
    flow.executions.create(from: TWILIO_FROM_NUMBER,
                           to: params[:phone_number],
                           parameters: {step: step_description}.to_json)
  end

  def client
    Twilio::REST::Client.new(Rails.application.credentials.twilio[:account_sid],
      Rails.application.credentials.twilio[:auth_token])
  end

  def step
    Step.find_by(id: params[:step_id]) if params[:step_id]
  end

  def step_description
    step&.body || STEP_DESCRIPTION
  end
end
