require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#create' do
    before do 
      @user = create(:user)
      @image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))
    end

    context "can save" do
      it "is valid with a title and image" do
        post = @user.posts.build(
          title: "sample",
          image: @image
        )
        expect(post).to be_valid
      end
    end

    context "cannot save" do
      it "is invalid without a title" do
        post = @user.posts.build(
          title: nil,
          image: @image
        )
        post.valid?
        expect(post.errors[:title]).to include("を入力してください")
      end

      it "is invalid without an image" do
        post = @user.posts.build(
          title: "sample",
          image: nil
        )
        post.valid?
        expect(post.errors[:image]).to include("を入力してください")
      end

    end


  end
end