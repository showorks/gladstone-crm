class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role)
  end

  def supporter
    can :read, :all
    cannot :manage, :user
  end

  def administrator
    can :manage, :all
  end

end
