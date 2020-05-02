class Ability
  include CanCan::Ability
    
    def initialize(user)

        if user.role == "super_admin"

         can :manage, :all

        elsif user.role == "admin"

          can :project_edit , :all
          can :task_edit , :all
          can :admin_edit , :all
          can :user_edit , :all
          can :edit , Organisation

          can :project_update , :all
          can :task_update , :all
          can :admin_update , :all
          can :user_update , :all
          can :update , Organisation

          can :project_destroy, :all
          can :task_destroy, :all
          can :admin_destroy, :all
          can :user_destroy, :all
          can :destroy, Organisation

        elsif user.role == "moderator"

          can :project_edit , :all
          can :task_edit , :all
          can :admin_edit , :all
          can :user_edit , :all
          can :edit , Organisation

          can :project_update , :all
          can :task_update , :all
          can :admin_update , :all
          can :user_update , :all
          can :update , Organisation

        end
    end

end
