module ApplicationHelper
  def form_errors(object)
    render partial: 'form_errors', locals: { object: object }
  end

  def meter_to_kilometer(meter)
    meter / 1000.0
  end

  def pretty_number(number)
    number_with_delimiter(number, delimiter: '.')
  end
end
