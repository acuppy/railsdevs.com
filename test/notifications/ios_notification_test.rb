require "test_helper"

class IosNotificationTest < ActiveSupport::TestCase
  setup do
    TestNotification = Class.new(ApplicationNotification) do
      include IosNotification
    end

    @notification = TestNotification.new
  end

  test "support for String tokens during cleanup" do 
    token_as_string = "abc123"

    assert_nothing_raised do
      @notification.cleanup_device_token(token: token_as_string, platform: nil)
    end
  end

  test "support for objects with an explicit #token method during cleanup" do
    token_as_object = OpenStruct.new do
      def token
        "def456"
      end
    end

    assert_nothing_raised do
      @notification.cleanup_device_token(token: token_as_object, platform: nil)
    end
  end
end
