class RentalPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  delegate :content_tag, :link_to, to: :helper

  def initialize(rental)
    super(rental)
  end
  
  def status
    if scheduled?
      content_tag(:span, class: "badge badge-success") do
        "Agendada"
      end
    else
      content_tag(:span, class: "badge badge-primary") do
        "em Andamento"
      end
    end
  end

  def withdraw_link
    return link_to 'Confirmar Retirada', withdraw_rental_path(id), method: :post if scheduled?

    ""
  end

  private 
  
  attr_reader :rental

  def helper
    ApplicationController.helpers
  end
end