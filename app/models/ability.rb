class Ability
  include CanCan::Ability
    
  def initialize(user)
    user.role.permissions.each do |permission|
      if permission.subject_class == "manage"
        can permission.subject_class.to_sym, permission.action.to_sym
        # can :manage, :all
        # can permission.action.to_sym, permission.subject_class.to_sym
      else
        can permission.subject_class.to_sym, permission.action.to_sym
    end
  end

    # def initialize(user)

    #     if user.super_admin? 

    #      can :manage, :all

    #     elsif user.admin?

    #       can :project_edit , :all
    #       can :task_edit , :all
    #       can :admin_edit , :all
    #       can :user_edit , :all
    #       can :edit , Organisation

    #       can :project_update , :all
    #       can :task_update , :all
    #       can :admin_update , :all
    #       can :user_update , :all
    #       can :update , Organisation

    #       can :project_destroy, :all
    #       can :task_destroy, :all
    #       can :admin_destroy, :all
    #       can :user_destroy, :all
    #       can :destroy, Organisation

    #     elsif user.moderator?

    #       can :project_edit , :all
    #       can :task_edit , :all
    #       can :admin_edit , :all
    #       can :user_edit , :all
    #       can :edit , Organisation

    #       can :project_update , :all
    #       can :task_update , :all
    #       can :admin_update , :all
    #       can :user_update , :all
    #       can :update , Organisation

    #     end
    # end

end
end
