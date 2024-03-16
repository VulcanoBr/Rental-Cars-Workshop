class RentalByPeriodQuery

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def call
    # Lógica para buscar os aluguéis dentro do intervalo de datas (@start_date..@end_date)
    # Implemente a lógica aqui para buscar os aluguéis dentro do intervalo de datas fornecido
    # e retornar um hash onde as chaves são os IDs dos carros e os valores são a quantidade de aluguéis
    # Exemplo hipotético:
    #rentals_within_period = Rental.where(finished_at: @start_date..@end_date)
    rentals_within_period = Rental.where('(finished_at BETWEEN ? AND ?) OR 
      finished_at = ? OR finished_at = ?', @start_date, @end_date, @start_date, @end_date).where(status: :finished)
      result = {}
    rentals_within_period.group(:car_id).count.each do |car_id, count|
    result[car_id] = count
  end
  return result

    # Neste exemplo, estou retornando um hash vazio, pois a lógica específica não está implementada
    #return {}
  end
end
