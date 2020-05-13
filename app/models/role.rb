class Role < ApplicationRecord
	has_many :admins
	has_and_belongs_to_many :permissions
	# def set_permissions(permissions)
 #  permissions.each do |id|
 #    #find the main permission assigned from the UI
 #    permission = Permission.find(id)
 #    self.permissions << permission
 #    case permission.subject_class
 #      when "Part"
 #        case permission.action
 #          #if create part permission is assigned then assign create drawing as well
 #          when "create"
 #            self.permissions << Permission.where(subject_class: "Model_detail", action: "user_create")
 #          #if update part permission is assigned then assign create and delete drawing as well
 #          when "update"
 #            self.permissions << Permission.where(subject_class: "Model_detail", action: ["user_update", "user_destroy"])
 #          end
 #        end
 #      end
 #    end
end
