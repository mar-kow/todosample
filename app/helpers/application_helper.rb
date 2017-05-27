module ApplicationHelper
  def logout_user_link
    link_to 'Logout', destroy_user_session_path, method: :delete
  end
end
