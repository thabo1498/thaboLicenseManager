class License < ApplicationRecord
  before_create :generate_license_key

  validates :app_name, :email, :expiry_date, presence: true

  def status
    return "Expired" if expired?
    return "Expiring Soon" if expiring_soon?
    "Active"
  end

  def expired?
    expiry_date < Time.current
  end

  def expiring_soon?
    expiry_date.between?(Time.current, 7.days.from_now)
  end

  private

  def generate_license_key
    self.license_key = "#{app_name.upcase}-#{SecureRandom.hex(10)}"
  end
end
