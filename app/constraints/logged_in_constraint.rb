class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session.key?('current_user_id') == value
  end
end
