class Types::UserType < Types::BaseObject

  description "A user"

  field :id, ID, null: true
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true, camelize: false 
  
  #只对当前已经登陆的用户显示graphicQL的query,不显示在documentation里面
  def self.visible?(context)
    #!! only if
    !!context[:current_user]
  end

end