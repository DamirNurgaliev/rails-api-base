class TokenSerializer < ApplicationSerializer
  delegate :token, to: :object

  set_id :token
end
