require "test_helper"

class LicenseMailerTest < ActionMailer::TestCase
  test "expiry_notice" do
    mail = LicenseMailer.expiry_notice
    assert_equal "Expiry notice", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
