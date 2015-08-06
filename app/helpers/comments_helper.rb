helpers do
  def find_commentable_question_id(comment)
    object_class = comment.commentable_type
    object = object_class.constantize.find(comment.commentable_id)
    if object_class == "Question"
      object.id
    elsif object_class == "Answer"
      object.question_id
    end
  end
end
