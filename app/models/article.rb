class Article < ApplicationRecord
  has_one_attached :image
  after_validation :set_slug, on: :create
  # validates :title, presence: true
  # valiadets :date, presence: true
  # valiadets :content, presence: true
  
  def to_param
    byebug
    "#{id}-#{slug}"
  end
  private
  def set_slug
    self.slug =title.to_s.parameterize
  end
end
