class Mutations::CreateAuthor < GraphQL::Schema::Mutation

  null true

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :yob, Int, required: false
  argument :is_alive, Boolean, required: false, camelize: false

  def resolve(first_name:, last_name:, yob:, is_alive:)
    Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
  end

  # 只能让当前是superadmin的用户来创建新用户
  def self.accessible?(context)
    context[:current_user]&.is_superadmin?
  end

end