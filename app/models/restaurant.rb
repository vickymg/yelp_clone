class Restaurant < ActiveRecord::Base

  has_many :reviews,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

end
