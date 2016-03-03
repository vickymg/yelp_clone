class Restaurant < ActiveRecord::Base

  has_many :reviews,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

  def average_rating
    return '☆☆☆☆☆' if reviews.none?
    reviews.average(:rating)
  end

end
