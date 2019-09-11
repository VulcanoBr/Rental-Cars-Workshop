class CarPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers

  def initialize(car, user)
    super(car)
    @user = user
  end

  def maintenance_link
    return new_car_maintenance_path(id) if @user.admin? && available?
    
    ''
  end

  private

  attr_reader :user
end