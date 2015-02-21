class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role)
  end

  def supporter
    can :read, :all
  end

  def administrator
    can :manage, :all
  end

end
