class Review < ActiveRecord::Base
  belongs_to :product
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true

  def created_by_current_user?(current_user)
    return user_id == current_user.id
  end
end
