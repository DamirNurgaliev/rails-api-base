module JsonApiController
  extend ActiveSupport::Concern

  included do
    def render_data(data, **args)
      render json: data, **args
    end

    def render_error(data, **args)
      args[:serializer] ||= ActiveModel::Serializer::ErrorSerializer
      args[:status] ||= :unprocessable_entity

      render json: data, status: status, **args
    end

    def jsonapi_params(options)
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, options)
    end
  end
end
