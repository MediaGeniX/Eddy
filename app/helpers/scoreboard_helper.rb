module ScoreboardHelper

  def yellow_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "Yellow Jersey",
      sub_title: "Most total distance",
      table_header: "Distance",
      color_value: "ffff00",
      data_block: Proc.new {|(user, meter)| pretty_number(meter_to_kilometer(meter))},
      user_block: Proc.new {|(user, meter)| user }
  end

  def polka_dot_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "Polka Dot Jersey",
      sub_title: "Most days biked",
      table_header: "Days",
      color_value: "ff0000",
      data_block: Proc.new {|(user, days)| pretty_number(days)},
      user_block: Proc.new {|(user, days)| user }

  end

  def green_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "No Jersey",
      sub_title: "Most distance on one day",
      table_header: "Distance",
      color_value: "ffffff",
      data_block: Proc.new {|user| pretty_number(meter_to_kilometer(user.maximum_total_distance))},
      user_block: Proc.new {|user| user }
  end

  def pink_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "Pink Jersey",
      sub_title: "Most total distance (women)",
      table_header: "Distance",
      color_value: "FFC0CB",
      data_block: Proc.new {|(user, meter)| pretty_number(meter_to_kilometer(meter))},
      user_block: Proc.new {|(user, meter)| user }
  end

  def white_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "White Jersey",
      sub_title: "Most total distance (< 26 year)",
      table_header: "Distance",
      color_value: "ffffff",
      data_block: Proc.new {|(user, meter)| pretty_number(meter_to_kilometer(meter))},
      user_block: Proc.new {|(user, meter)| user }
  end

  def grey_jersey_card(jersey_data)
    jersey_card data: jersey_data,
      title: "Grey Jersey",
      sub_title: "Most total distance (> 50 year)",
      table_header: "Distance",
      color_value: "D3D3D3",
      data_block: Proc.new {|(user, meter)| pretty_number(meter_to_kilometer(meter))},
      user_block: Proc.new {|(user, meter)| user }
  end

  def jersey_card(data:, title:, sub_title:, table_header:, color_value:, data_block:, user_block:)
    render partial: 'jersey_card',
      locals: {data: data,
               extract_block: data_block,
               title: title,
               sub_title: sub_title,
               table_header: table_header,
               color_value: color_value,
               user_block: user_block,
              }
  end
end
