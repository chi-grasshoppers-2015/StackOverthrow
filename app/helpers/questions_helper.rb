helpers do

  def sorted_answer_list(question)
    p question
    sorted_answers = question.answers.sort { |a1, a2| Vote.tally(a2) <=> Vote.tally(a1) }
    p sorted_answers
    best_answer = sorted_answers.find { |answer| answer.best_answer }
    if best_answer
      best = sorted_answers.delete(best_answer)
      return sorted_answers.unshift(best)
    else
      return sorted_answers
    end
  end

end
