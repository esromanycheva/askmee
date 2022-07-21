module ApplicationHelper
  def inclination(count, one, few, many)
    return many if (count % 100).between?(11,14)

    case count % 10
    when 1 then one
    when 2..4 then few
    else
      many
    end
  end

  def tags_with_links(text)
    text.gsub(Hashtag::VALID_HASHTAG_REGEX) { |tag| link_to tag, hashtag_path(tag) }
  end
end
