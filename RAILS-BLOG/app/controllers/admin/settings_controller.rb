class Admin::SettingsController < Admin::ApplicationController
  def new
    if Setting.any?
      redirect_to edit_admin_setting_url(Setting.first)
    else 
      @setting = Setting.new
    end
  end

  def create
    @setting = Setting.new(settings_param)
    if @setting.save
      redirect_to edit_admin_setting_url(@setting), notice: 'Successfully created setting.'
    else
      flash[:alert] = "Problem while creating setting"
      render 'new'
    end
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(settings_param)
      redirect_to edit_admin_setting_url(@setting), notice: 'Setting updated Successfully.'
    else
      flash[:alert] = 'Problem updating setting'
      render 'new'
    end
  end

  private 

  def settings_param
    params.require(:setting).permit(:site_name,:posts_per_page,:under_maintenance,:prevent_commenting,:tag_visibility)
  end
end