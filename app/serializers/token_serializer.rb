class TokenSerializer < ApplicationSerializer
  set_id :token do |object|
    object.token
  end
end
