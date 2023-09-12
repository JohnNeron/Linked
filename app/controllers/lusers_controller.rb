class LusersController < ApplicationController
    before_action :authenticate_luser!
    before_action :admin?

    def index
        # @lusers = Lusers.where.not(:id => current_luser.id)
    end

    def show
        @luser = Luser.find(params[:id])
    end

    def new
        @luser = Luser.new
    end

    def edit
        @luser = Luser.find(params[:id])
    end

    def create
        @luser = Luser.new(luser_params)
        if params[:luser][:password].blank?
            params[:luser].delete(:password)
            params[:luser].delete(:password_confirmation)
        end
        password_setting(@luser)

        if @luser.save
            flash[:notice] = "El Usuario se ha creado"
            redirect_to lusers_path
        else
            flash[:alert] = @luser.errors.full_messages
            render :action => 'new'
        end
    end

    def update
        @luser = Luser.find(params[:id])
        params[:luser].delete(:password)
        if params[:luser][:password].blank
            params[:luser].delete(:password_confirmation)
        end
        if params[:luser][:password].blank? && params[:luser][:password_confirmation].blank?
            if @luser.update(luser_params)
                flash[:notice] = "Usuario actualizado con exito."
                redirect_to lusers_path
            else
                respond_to do |format|
                  format.html { redirect_to new_luser_path, alert: @luser.errors.full_messages }
                end
            end
        end
    end

    def destroy
        @luser = Luser.find(params[:id])
        if @luser.destroy
          flash[:notice] = "Usuario Eliminado"
          redirect_to lusers_path
        end
    end

    private

    def luser_params
        params.require(:luser).permit(:email, :name, :lastname, :age, :avatar, limages: [])
    end

    def password_setting(luser)
        generated_password = "111111"
    
        psuser.password = generated_password
        psuser.password_confirmation = generated_password
        generated_password
    end

    def admin?
        if not current_luser.admin?
          respond_to do |format|
            format.html { redirect_to lposts_path, alert: "No tienes acceso" }
          end
        end
     end
end