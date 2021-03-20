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
      "Hello #{name}"
    end

  end
end
