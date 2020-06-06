class Ability
  include CanCan::Ability
    
  def initialize(user)
    
      if user.super_admin?
        # can permission.subject_class.to_sym, permission.action.to_sym
        can :manage, :all
      else
        user.role.permissions.each do |permission|
            can permission.subject_class.to_sym, permission.action.to_sym
        end
      end
    end
end