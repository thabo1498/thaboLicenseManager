class LicenseMailer < ApplicationMailer
  default from: "noreply@license-manager.com"

  def expiry_notice(license)
    @license = license

    mail(
      to: @license.email,
      subject: "Your license for #{@license.app_name} is expiring soon"
    )
  end
end
