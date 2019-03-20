class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  # BAITS = [
  #   /Won't Believe/i,
  #   /Secret/i,
  #   /Top [0-9]*/i,
  #   /Guess/i
  # ]

  def clickbaity?
    baits = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
    # baits.none? do |b|
    #   binding.pry
    #   b.match(title)
    # end

    if baits.none? {|b| b.match title }
      errors.add(:title, "must be clickbait")
    end
    # BAITS.each do |b|
    #   if !self.title.include?(b)
    #     return errors.add(:title, "invalid title without clickbait")
    #   end
    # end
  end
end
