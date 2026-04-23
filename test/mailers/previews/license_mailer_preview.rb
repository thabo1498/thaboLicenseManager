# Preview all emails at http://localhost:3000/rails/mailers/license_mailer
class LicenseMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/license_mailer/expiry_notice
  def expiry_notice
    LicenseMailer.expiry_notice
  end
end
