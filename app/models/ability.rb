class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role)
  end

  def supporter
    can :read, :all
    can :search, Fair
    can :create, Contact
    can [:edit, :update], Contact, sync: true
    can :create, Message
    can [:edit, :update], Message, sync: true
    cannot :read, File
    cannot :read, User
  end

  def administrator
    can :manage, :all
  end

end
