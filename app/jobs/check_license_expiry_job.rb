class CheckLicenseExpiryJob < ApplicationJob
  queue_as :default

  def perform
    licenses = License.where(expiry_date: Time.current..7.days.from_now)

    licenses.find_each do |license|
      LicenseMailer.expiry_notice(license).deliver_now
    end
  end
end
