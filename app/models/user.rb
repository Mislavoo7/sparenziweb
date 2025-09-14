# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  api_token              :string
#  blocked_at             :datetime
#  currency               :string           default("€")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  theme                  :string           default("dark")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  language_id            :string           default("en")
#
# Indexes
#
#  index_users_on_api_token             (api_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists
  
  def blocked?
    !self.blocked_at.blank?
  end

  def self.all_active
    where(blocked_at: nil)
  end
  
  private
  
  def generate_api_token
    loop do
      self.api_token = SecureRandom.hex(32)
      break unless User.exists?(api_token: api_token)
    end
  end
  
  def regenerate_api_token!
    generate_api_token
    save!
  end

  LANGUAGES = ["hr", "en", "de"]
  def self.allowed_languages
    User::LANGUAGES.map{|c| [I18n.t("activerecord.attributes.user.languages.#{c.gsub("-", "_")}"), c]}
  end

  CURRENCIES = ["$", "€"]
  def self.allowed_currencies
    User::CURRENCIES.map{|c| [I18n.t("activerecord.attributes.user.currencies.#{c.gsub("-", "_")}"), c]}
  end

  THEMES = ["dark", "light"]
  def self.allowed_themes
    User::THEMES.map{|c| [I18n.t("activerecord.attributes.user.themes.#{c.gsub("-", "_")}"), c]}
  end

end
