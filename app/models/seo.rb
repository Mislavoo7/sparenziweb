# == Schema Information
#
# Table name: seos
#
#  id           :bigint           not null, primary key
#  image        :string
#  position     :integer          default(0)
#  seoable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  seoable_id   :integer
#
class Seo < ApplicationRecord
  include Translateable
  mount_uploader :image, ImageUploader
  has_many :seo_translations, dependent: :destroy
  accepts_nested_attributes_for :seo_translations
  default_scope { order(position: :asc) }
  belongs_to :seoable, polymorphic: true, required: false

  def self.default_title
    "Sparenzi"
  end

  def self.default_author
    "Sparenzi"
  end

  def self.default_description
    ""
  end

  def self.default_keywords
    ""
  end

  def self.default_image
    'logo_with_text.png'
  end
end
