module ApplicationHelper

  def locale
    I18n.locale == :en ? "en" : "pt-BR"
  end
  
  def convert_to_date_br(date)
    date.strftime("%d/%m/%Y")
  end

end
