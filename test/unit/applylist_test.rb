# == Schema Information
#
# Table name: applylists
#
#  id           :integer         not null, primary key
#  micropost_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ApplylistTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
