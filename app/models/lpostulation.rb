class Lpostulation < ApplicationRecord
  belongs_to :luser, optional: true
  belongs_to :lpost, optional: true

  validates :kind, acceptance: {
    accept: %w[ Postular ]
  }

  def self.kinds
    %w[ Postular ]
  end

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    LpostulationNotification.with(lpostulation: self, lpost: lpost).deliver_later(Luser.first)
  end

  def cleanup_notifications
    notifications_as_lpostulation.destroy_all
  end
end
