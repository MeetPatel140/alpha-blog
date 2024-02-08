module BlogsHelper

  def truncate_title(title)
    max_length = 100
    if title.length > max_length
      title.slice(0, max_length) + " ..."
    else
      title
    end
  end

  def truncate_description(description)
    max_length = 300
    if description.length > max_length
      description.slice(0, max_length) + " ..."
    else
      description
    end
  end

end
