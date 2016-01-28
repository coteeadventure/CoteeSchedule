module ApplicationHelper
  
  def pretty_count(count, none_label = 'none')
    if count.respond_to? :count
      count = count.count
    end
    
    if (not count) or count == 0
      none_label
    else
      count
    end
  end
  
  def relative_datetime(datetime)
    pretty_datetime(datetime)
  end
  
  def pretty_datetime(datetime)
    pretty_date(datetime) + ' at ' + pretty_time(datetime)
  end
  
  def pretty_date(date)
    date.strftime '%A, %b %d'
  end
  
  # FIXME The single-digit hour has a space in front of it. Remove that.
  def pretty_time(time)
    time.strftime '%l:%M %p'
  end
  
  def a_or_an(params_word, uppercase = false)
    if uppercase
      a = "A"
      an = "An"
    else
      a = "a"
      an = "an"
    end
    
    %w(a e i o u).include?(params_word[0].downcase) ? "#{an} #{params_word}" : "#{a} #{params_word}"
  end
  
  def collection_radio_group(object, method, collection, value_method, text_method, options = {}, html_options = {})
    Tags::CollectionSelect.new(object, method, self, collection, value_method, text_method, options, html_options).render
  end
  
  
end
