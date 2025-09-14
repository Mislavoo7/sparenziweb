# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  company       :string
#  is_visible    :boolean          default(TRUE)
#  position      :integer          default(1000)
#  price_in_cent :integer          default(0)
#  product_name  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  app_id        :integer
#  list_id       :integer
#
class Product < ApplicationRecord
  include VisibilityMethods
  include PositionMethods
  default_scope { order(:position) }
  after_save :add_to_total
  after_destroy :add_to_total
  before_save :add_app_id

  belongs_to :list

  attr_accessor :price_for_enter

  def add_app_id
    # in react native the same method is used:
    #const timestampPart = Math.floor(Date.now() / 1000) % 100000; // last 5 digits
    #const randomPart = Math.floor(Math.random() * 900) + 100;     // 3-digit
    #return `${timestampPart * 1000 + randomPart}`;
    if self.app_id.blank?
      timestamp_part = Time.now.to_i % 100_000 
      random_part = rand(100..999) 

      self.app_id = timestamp_part * 1000 + random_part
    end
  end

  def price
    cents = self.price_in_cent
    (cents / 100.00)
  end

  def price_humanized
    currency = self.list.currency
    sprintf("%.2f #{currency}", self.price).gsub('.00','')
  end

  def add_to_total
    if self.list.blank? or self.price_in_cent.blank?
      self.destroy
    else
      new_total = self.list.products.sum(:price_in_cent)
      self.list.update(total_price_in_cent: new_total)
    end
  end
end
