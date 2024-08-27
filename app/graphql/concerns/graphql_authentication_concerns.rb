module GraphqlAuthenticationConcerns
  AUTH_ERROR_MESSAGE = 'authentication failed'.freeze

  def authenticate_user!
    return if context[:current_user]

    raise GraphQL::ExecutionError.new(
      AUTH_ERROR_MESSAGE,
      extensions: { code: 'AUTHENTICATION_ERROR' },
    )
  end

  def current_user
    context[:current_user]
  end
end
