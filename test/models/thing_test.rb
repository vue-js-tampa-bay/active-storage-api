# == Schema Information
#
# Table name: things
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
