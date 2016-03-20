module ScoreboardHelper
  def meter_to_kilometer(meter)
    meter/1000
  end

  def pretty_number(number)
    number_with_delimiter(number, delimiter: '.')
  end
end
