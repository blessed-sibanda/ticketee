class Ticket < ApplicationRecord
  belongs_to :project
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }
  belongs_to :author, class_name: "User"
end
