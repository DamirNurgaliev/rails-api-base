module JsonApiController
  extend ActiveSupport::Concern

  included do
    def render_error(data, status = :unprocessable_entity)
      render json: ErrorSerializer.new(data), status: status
    end
  end
end
