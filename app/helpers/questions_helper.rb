module QuestionsHelper
  def link_to_author(question)
    if question.author
      "от автора #{link_to("@#{question.author.nickname}", user_path(question.author))}".html_safe
    end
  end
end
