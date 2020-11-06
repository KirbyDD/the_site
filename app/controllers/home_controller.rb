class HomeController < ApplicationController
  def index; end

  def update
    users = User.all

    users.each do |user|
      unless user.email == 'tkd024@gmail.com'
        user.update(role: 0)
      else
        user.update(role: 1)
      end
    end
    redirect_to '/'
  end
end
