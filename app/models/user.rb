# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  age        :integer
#  country    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\@mediagenix\.tv/, message: 'You should have an email from mediagenix.tv'

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
