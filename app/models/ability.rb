class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    if user.roles == 'admin'
      can :manage, :all
    elsif user.roles == 'trainer'
#      can [:create, :update, :read, :display], Trainer      
      can :manage, :all
    elsif user.roles == 'student'
      can [:create, :update, :read], Student, :id => @user.id
    end
  end
end
