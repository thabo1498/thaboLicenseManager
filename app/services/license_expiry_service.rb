class LicenseExpiryService
  def self.run
    License.expiring_soon.find_each do |license|
      LicenseMailer.expiry_notice(license).deliver_now
      puts "Email sent to #{license.email}"
    end
  end
end
