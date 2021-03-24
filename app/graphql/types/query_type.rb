# 所有root query都在这个文件
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    # 有值从前端传入
    field :test_field, String, null: false,
      #需要使用 do..end
      description: "An example field added by the generator" do
        #加入需要使用的argument
        argument :name, String, required: true
      end
    #将argument传入
    def test_field(name:)
      #log调用graphql controoler中context的time值
      Rails.logger.info context[:time]
      "Hello #{name}"
    end

    #root query for author
    field :author, Types::AuthorType, null: true, description: "One author" do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.where(id: id).first
    end

    #返回authors的array
    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    #登陆的api，返回值为session string
    field :login, String, null: true, description: "Login a user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login(email:, password:)
      # 如果找到用户
      if user = User.where(email: email).first &.authenticate(password)
        # 生成并返回session key
        user.sessions.create.key
      end
    end

    # 返回当前登陆的user
    field :current_user, Types::UserType, null: true, description: "The current logged in user"
    def current_user
      context[:current_user]
    end

  end
end
