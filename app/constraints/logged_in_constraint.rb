class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session[:student_id] == value || request.session[:student_id].nil?
  end
end
