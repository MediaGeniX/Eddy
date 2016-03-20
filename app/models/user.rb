# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  birthdate              :date             not null
#  location               :integer          default(0), not null
#  admin                  :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
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
  has_many :routes
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :birthdate, presence: true
  validates :location, presence: true
  validates :sex, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\@mediagenix\.tv/, message: 'Fill in your mediagenix.tv address'

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum location: [:belgium, :skopje]
  enum sex: [:male, :female]
end
