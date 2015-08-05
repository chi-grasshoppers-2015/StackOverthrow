module Seed

  def self.run
    200.times do
      user = User.new(username: Faker::Internet.user_name,
                  email:    Faker::Internet.email,
                  password: "1234")
      if user.valid?
        user.save
      end

    end

    100.times do
      user = User.all.sample
      Question.create(author_id: user.id,
                      title: Faker::Company.catch_phrase,
                      body: Faker::Lorem.paragraph(sentence_count = 4, random_sentences_to_add = 3))
    end

    300.times do
      user = User.all.sample
      question = Question.all.sample
      Answer.create(author_id: user.id,
                     question_id: question.id,
                     body: Faker::Lorem.paragraph(sentence_count = 2, random_sentences_to_add = 2))
    end

    300.times do
      user = User.all.sample
      question = Question.all.sample
      Comment.create(author_id: user.id,
                     commentable_id: question.id,
                     commentable_type: "Question",
                     body: Faker::Lorem.paragraph(sentence_count = 1))
    end

    300.times do
      user = User.all.sample
      answer = Answer.all.sample
      Comment.create(author_id: user.id,
                     commentable_id: answer.id,
                     commentable_type: "Answer",
                     body: Faker::Lorem.paragraph(sentence_count = 1))
    end

    1000.times do
      user = User.all.sample
      question = Question.all.sample
      Vote.create(voter_id: user.id,
                  votable_id: question.id ,
                  votable_type: "Question")
    end

    1000.times do
      user = User.all.sample
      answer = Answer.all.sample
      Vote.create(voter_id: user.id,
                  votable_id: answer.id ,
                  votable_type: "Answer")
    end

    1000.times do
      user = User.all.sample
      comment = Comment.all.sample
      Vote.create(voter_id: user.id,
                  votable_id: comment.id ,
                  votable_type: "Comment")
    end


  end

end
