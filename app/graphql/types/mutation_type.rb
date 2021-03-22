# 所有前端更改都在该文件
module Types
  class MutationType < Types::BaseObject

    # #第一种创建方式
    # field :create_author, AuthorType, null: false, description: "Create an author" do
    #   # argument :first_name, String, required: false, camelize: false
    #   # argument :last_name, String, required: false, camelize: false
    #   # argument :yob, Int, required: false
    #   # argument :is_alive, Boolean, required: false, camelize: false
    # end
    # def create_author(first_name:, last_name:, yob:, is_alive:)
    #   Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    # end

    #第二种创建方式，使用delegate mutation, 使用的 mutations/create_author.rb
    # field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

    #第三种方式，使用inputtype
    field :create_author, AuthorType, null: false, description: "Create an author" do
      argument :author, Types::AuthorInputType, required: true
    end
    def create_author(author:)
      Author.create(author.to_h)
    end

    #update record
    #只需要返回boolean值就行
    field :update_author, Boolean, null: false, description: "Update an author" do
      argument :author, Types::AuthorInputType, required: true
    end
    def update_author(author:)
      existing = Author.where(id: author[:id]).first
      existing &.update(author.to_h)
    end

    #delete record
    field :delete_author, Boolean, null:false, description: "Delete an author" do
      argument :id, ID, required: true
    end
    def delete_author(id:)
      Author.where(id: id).destroy_all
      true
    end
  end
end
