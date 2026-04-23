class LicensesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @licenses = License.all.order(created_at: :desc)
    today = Date.today
    soon = today + 7
    @total = License.count
    @expired = License.where("expiry_date < ?", today).count
    @expiring_soon = License.where("expiry_date >= ? AND expiry_date <= ?", today, soon).count
    @active = License.where("expiry_date >= ?", today).count  # includes expiring soon
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
