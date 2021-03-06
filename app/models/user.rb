class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    admin ? "#{email} (Admin)" : email
  end

  def archive!
    self.archived_at = Time.now
    self.save!
  end

  scope :active, -> { where(:archived_at => nil) }

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end
end
