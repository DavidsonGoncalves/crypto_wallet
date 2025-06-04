module ApplicationHelper

  def convert_to_date_br(date)
    date.strftime("%d/%m/%Y")
  end

end
