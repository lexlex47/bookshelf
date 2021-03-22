# 所有前端更改都在该文件
module Types
  class MutationType < Types::BaseObject

    # #第一种创建方式
    # field :create_author, AuthorType, null: false, description: "Create an author" do
    #   argument :first_name, String, required: false, camelize: false
    #   argument :last_name, String, required: false, camelize: false
    #   argument :yob, Int, required: false
    #   argument :is_alive, Boolean, required: false, camelize: false
    # end
    # def create_author(first_name:, last_name:, yob:, is_alive:)
    #   Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    # end

    #第二种创建方式，使用delegate mutation
    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

  end
end
