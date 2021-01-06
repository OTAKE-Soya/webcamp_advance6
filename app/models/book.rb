class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
  def self.search(pattern, word)
    if pattern == "exact"
      where(title: word)
    elsif pattern == "forword"
      where("title like ?", "#{word}%")
    elsif pattern == "backword"
      where("title like ?", "%#{word}")
    elsif pattern == "partial"
      where("title like ?", "%#{word}%")
    end
  end
end
