class ClickBaitValidator < ActiveModel::Validator
  def validate(post)
    if post.title == nil
      post.errors[:title] << 'Can"t be nil'
    elsif !post.title.include?("Won't Believe") && !post.title.include?("Secret") && !post.title.include?("Top ") && !post.title.include?("Guess")
      post.errors[:title] << 'Clickbait'
    end
  end
end
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with ClickBaitValidator


end
