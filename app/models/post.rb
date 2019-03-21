class Post < ActiveRecord::Base

  validates :title, {presence: true}
  short = "You Won't Believe These True Facts".length + 1
  validates :content, length: {in: short..300}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    patterns = [/Won't Believe/, /Secret/, /Top \d+/, /Guess/]
    matches = patterns.map { |pattern| pattern.match(self.title)}
    if (matches - [nil]).empty?
      errors.add(:title, "must be clickbait")
    end
  end
end

# patterns = [/foo/, /bar/]
# input = 'baz'
# patterns.all? { |pattern| pattern.match?(input) }
