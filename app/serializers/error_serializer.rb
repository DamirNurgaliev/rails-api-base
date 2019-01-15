class ErrorSerializer
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def to_hash
    object_errors = object.errors.messages.map do |field, errors|
      errors.map do |error_message|
        {
          source: { pointer: "/data/attributes/#{field}" },
          detail: error_message
        }
      end
    end

    { "errors" => object_errors.flatten }
  end
end
