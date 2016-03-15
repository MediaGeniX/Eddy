# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  country                :integer
#  birthday               :date
#  location               :integer          default("0")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :birthday, presence: true
  validates :location, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\@mediagenix\.tv/, message: 'You should have an email from mediagenix.tv'

  has_many :trips

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum location: [ :belgium, :skopje ]
end
