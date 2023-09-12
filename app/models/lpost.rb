class Lpost < ApplicationRecord
  belongs_to :luser, optional: true
  has_many :lpostulations, dependent: :destroy
  has_many :lusers, through: :lpostulations, dependent: :destroy

  has_many_attached :limages
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :lusers, dependent: :destroy

  def find_kind_luser_relation(luser)
    self.lpostulation.find_by(luser_id: luser.id).kind
  end
end
