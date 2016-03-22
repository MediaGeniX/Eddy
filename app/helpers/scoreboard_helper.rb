module ScoreboardHelper

  def yellow_yersey_card(yersey_data)
    yersey_card data: yersey_data,
      title: "Yellow Jersey",
      sub_title: "Most total distance",
      table_header: "Distance",
      color_value: "ffff00",
      data_block: Proc.new {|(user, meter)| pretty_number(meter_to_kilometer(meter))}
  end

  def yersey_card(data: data, title: title, sub_title: sub_title, table_header: table_header, color_value: color_value, data_block: data_block)
    render partial: 'yersey_card',
      locals: {data: data,
               extract_block: data_block,
               title: title,
               sub_title: sub_title,
               table_header: table_header,
               color_value: color_value,
              }
  end
end
