class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, :length => {:maximum => 250}
  validates :content, :length => {:minimum => 250}
  validates :category, :inclusion => {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait?

  def click_bait?
    title = self.title
    if (title != "" && title != nil)
      if (!(title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")))
        errors.add(:title, "needs to be more clickbaity")
      end
    end
  end
end
