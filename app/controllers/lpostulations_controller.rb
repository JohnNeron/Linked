class LpostulationsController < ApplicationController
  before_action :authenticate_luser!

  def luser_apply
    @luser = current_luser
    @lpost = Lpost.find(params[:lpost_id])
    lpostulation = Lpostulation.find_by(luser_id: @luser.id, lpost_id: @lpost.id)
    if apply
      return flash.now[:alert] = 'Ya Postulaste a esta oferta'
    else
      @new_lpostulation = Lpostulation.new(luser_id: @luser.id, lpost_id: @lpost.id, kind: params[:kind])
      respond_to do |format|
        if @new_lpostulation.save!
          format.html { redirect_to lpost_path(@lpost), notice: "#{current_luser.name} ha dado a #{@new_lpostulation.kind}
          en está oferta" }
        else
          format.html { redirect_to lpost_path(@lpost), status: :unprocessable_entity }
        end
      end
    end
  end
   
  def lpost_with_lpostulations
    @lpostulations = current_luser.lpostulations
    lpost_ids = @lpostulations.map(&:lpost_id)
    @lpost = Lpost.where(id: lpost_ids)
  end
end
