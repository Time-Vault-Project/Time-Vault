class Journal < ApplicationRecord
  has_rich_text :content

  belongs_to :user

  validates :title, :content, :date, presence: true
end
