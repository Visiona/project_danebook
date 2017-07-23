module ApplicationHelper

  def formatted_date(date)
    date.strftime("Posted on %A %d/%m/%Y")
  end

  def list_who_liked(post)
    str = ""
    first_few_likes(post).each do |link|
      if link.id == current_user.id
        str += "You"
      else
        str += link_to("#{full_name(link)}", link.user, class: "liking")
      end
      str += 'and' unless first_few_likes(post).last == link
    end
    str.html_safe
  end

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def signed_in_user?
    !!current_user
  end

end
