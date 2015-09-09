# encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all
    # case user.role
    # when "管理员"
    #   can :manage, :all
    # when "人事"
    # end
  end
end