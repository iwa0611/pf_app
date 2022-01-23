class MyFailureApp < Devise::FailureApp
  def route(scope)
    hobbyspot_path
  end
end
