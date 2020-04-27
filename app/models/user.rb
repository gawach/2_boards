# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  validation :name,
  uniquness: true,
  length: { maxmum: 16 },
  format: {
    width: /\A[a-z0-9]+\z/,
    message: 'は小文字英数字で入力してください'
  }
  validation :password,
    length: { minimum: 8 }
end
