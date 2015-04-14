class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    send(@user.role, @user.id)
  end

  def supporter(user_id)
    can :read, :all
    can :search, Fair

    can :create, Contact
    can [:edit, :update], Contact, sync: true
    can :destroy, Contact, sync: true, created_by: user_id

    can :create, Message
    can [:edit, :update], Message, sync: true
    can :destroy, Message, sync: true, created_by: user_id

    cannot :read, File
    cannot :read, User
  end

  def administrator(user_id)
    can :manage, :all
  end

end
