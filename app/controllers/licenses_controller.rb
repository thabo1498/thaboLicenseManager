class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @licenses = License.all.order(created_at: :desc)
  end

  def new
   @license = License.new
  end

  def send_expiry_emails
    CheckLicenseExpiryJob.perform_now
    redirect_to licenses_path, notice: "Expiry emails sent successfully"
  end

  def create
    license = License.new(license_params)

    if license.save
      redirect_to licenses_path, notice: "License created successfully"
    else
      render :new
    end
  end

  def show
  @license = License.find_by(app_name: params[:app_name])

    if @license.nil?
      redirect_to licenses_path, alert: "License not found"
    end

  end

  private

  def license_params
    params.require(:license).permit(:app_name, :email, :expiry_date)
  end
end
