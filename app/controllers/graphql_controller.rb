# typed: strict
# frozen_string_literal: true

class GraphQLController < ApplicationController
  extend T::Sig

  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  sig { returns(T.untyped) }
  def execute
    operation_name = params["operationName"]
    unless operation_name.nil?
      raise "operationName must be a String" unless operation_name.is_a?(String)
    end
    query = params[:query]
    unless query.nil?
      raise "query must be a String" unless query.is_a?(String)
    end

    variables = prepare_variables(params[:variables])
    extensions = prepare_extensions(params[:extensions])
    context = {
      extensions: extensions,
      current_user: current_user,
      controller: self,
    }

    result =
      Schema.execute(
        query,
        variables: variables,
        operation_name: operation_name,
        context: context,
      )
    render(json: result)
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value.
  sig { params(variables_param: T.untyped).returns(T::Hash[String, T.untyped]) }
  def prepare_variables(variables_param)
    ensure_hash(variables_param) do
      raise ArgumentError, "Unexpected variables parameter: #{variables_param}"
    end
  end

  # Handle extensions in form data, JSON body, or a blank value.
  sig do
    params(extensions_param: T.untyped).returns(T::Hash[String, T.untyped])
  end
  def prepare_extensions(extensions_param)
    ensure_hash(extensions_param) do
      raise ArgumentError,
            "Unexpected extensions parameter: #{extensions_param}"
    end
  end

  sig do
    params(param: T.untyped, block: T.proc.void)
      .returns(T::Hash[String, T.untyped])
  end
  def ensure_hash(param, &block)
    case param
    when String
      param.present? ? JSON.parse(param) || {} : {}
    when Hash
      param
    when ActionController::Parameters
      # GraphQL-Ruby will validate name and type of incoming extensions.
      param.to_unsafe_hash
    when nil
      {}
    else
      yield
    end
  end

  sig { params(e: StandardError).returns(T.untyped) }
  def handle_error_in_development(e)
    logger.error(e.message)
    logger.error((e.backtrace || []).join("\n"))

    render(
      json: {
        errors: [{ message: e.message, backtrace: e.backtrace }],
        data: {},
      },
      status: :internal_server_error,
    )
  end

  sig { returns(T::Boolean) }
  def protect_from_forgery?
    local =
      case request.hostname
      when "localhost"
        true
      when "127.0.0.1"
        true
      else
        false
      end
    !local || request.origin.present?
  end
end