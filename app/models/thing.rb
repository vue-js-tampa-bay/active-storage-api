# frozen_string_literal: true

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

class Thing < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
end
