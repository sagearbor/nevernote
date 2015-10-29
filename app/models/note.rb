class Note < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 200 }

  belongs_to :user
end
