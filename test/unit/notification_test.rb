# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  noti_type  :string(255)
#  target_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
