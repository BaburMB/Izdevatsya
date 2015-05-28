module ApplicationHelper

  #Добавил сюда дефолтный title, если page_title не задан в html, он будет возвращать этот base_title
  def full_title(page_title)
    base_title="#hashtagkg"
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
  end
end
