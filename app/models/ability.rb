class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role)
  end

  def supporter
    can :read, :all
    can :search, :all
    cannot :read, File
    cannot :read, User
  end

  def administrator
    can :manage, :all
  end

end
