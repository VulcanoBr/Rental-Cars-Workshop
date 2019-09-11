class RentalDecorator < ApplicationDecorator
  delegate_all

  def started_at
    return '---' if object.scheduled?

    object.started_at
  end
end