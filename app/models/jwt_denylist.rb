# == Schema Information
#
# Table name: jwt_denylists
#
#  id         :bigint           not null, primary key
#  exp        :datetime
#  jti        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_jwt_denylists_on_jti  (jti)
#
# app/models/jwt_denylist.rb
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylists' 
end
