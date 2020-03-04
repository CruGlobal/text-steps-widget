class StepSetSubscriptionsController < ApplicationController
  TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:from_number]

  def new
  end

  def create
    create_twilio_session

    redirect_to step_set_subscription_path(1)
  end

  def show
  end

  private

  def create_twilio_session
    client = Twilio::REST::Client.new(Rails.application.credentials.twilio[:account_sid],
      Rails.application.credentials.twilio[:auth_token])
    flow = client.studio.v1.flows(Rails.application.credentials.twilio[:flow_id])
    flow.executions.create(from: TWILIO_FROM_NUMBER, to: params[:phone_number])
  end
end
