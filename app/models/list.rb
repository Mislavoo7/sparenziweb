# == Schema Information
#
# Table name: lists
#
#  id                  :bigint           not null, primary key
#  currency            :string           default("€")
#  is_visible          :boolean          default(TRUE)
#  position            :integer          default(1000)
#  shop_name           :string
#  taken_at            :datetime
#  total_price_in_cent :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
class List < ApplicationRecord
  include VisibilityMethods
  include PositionMethods
  default_scope { order(:position) }

  belongs_to :user
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products

  def total_price
    cents = self.total_price_in_cent
    (cents / 100.00)
  end

  def total_price_humanized
    sprintf("%.2f #{self.currency}", self.total_price).gsub('.00','')
  end

  def self.total_amount_in_cent
    all.sum(:total_price_in_cent)
  end

  def self.total_amount
    all.total_amount_in_cent / 100.0
  end

  def self.total_amount_humanized(currency)
    sprintf("%.2f #{currency}", self.total_amount).gsub('.00','')
  end
end
