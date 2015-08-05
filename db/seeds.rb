module Seed

  def self.run
    100.times do
      User.create(username: Faker::Internet.user_name,
                  email:    Faker::Internet.email,
                  password: "1234")
    end

  end

end
