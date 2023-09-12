# To deliver this notification:
#
# LpostulationNotification.with(post: @post).deliver_later(current_user)
# LpostulationNotification.with(post: @post).deliver(current_user)

class LpostulationNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @lpost = Lpost.find(params[:apply][:pspost_id])
    @lpostulation = Lpostulation.find(params[:apply][:id])
    @luser = Luser.find(@lpostulation.psuser_id)
    "#{@luser.name} aplico a #{@lpost.title}"
  end
  #
  def url
    lpost_path(Lpost.find(params[:lpostulation][:lpost_id])
  end
end
