require "spec_helper"


module ActiveScopes
  describe Scopes do
    before :each do
      ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database:':memory:')
      ActiveRecord::Schema.define do
        create_table :posts, force: true do |t|
          t.string :active, default: true
        end
      end
    end

    describe '.active' do
      before :each do
        class Post < ActiveRecord::Base
          extend ActiveScopes::Scopes
        end
      end

      it "returns records with active = true" do
        post1 = Post.create(active: false)
        post2 = Post.create(active: true)
        posts = Post.active

        expect(posts.size).to eq 1
        expect(posts).to include(post2)
      end
    end
  end
end