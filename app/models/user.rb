# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :todos, class_name: :Todo, foreign_key: :user_id, dependent: :destroy
  has_many :steps, through: :todos, source: :steps
end
