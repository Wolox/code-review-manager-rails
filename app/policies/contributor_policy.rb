class ContributorPolicy < ApplicationPolicy
  attr_reader :user, :contributor

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    user.admin? || !post.published?
  end
end
