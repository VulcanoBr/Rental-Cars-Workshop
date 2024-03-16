class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show]

  def new; end

  def index
    @customers = params[:name].present? ? Customer.search_by_name(params[:name]) : Customer.order_by_name.all
  end

  def show; end

  def search
    @customers = Customer.search_by_name(params[:name])
    return :index if @customers
    redirect_to root_path, notice: 'Nenhum cliente encontrado !!!'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
