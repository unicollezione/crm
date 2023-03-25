# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  email                     :string
#  password_digest           :string
#  first_name                :string
#  last_name                 :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class User < ApplicationRecord
  devise :database_authenticatable
end
