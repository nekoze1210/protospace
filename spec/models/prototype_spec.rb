require 'rails_helper'

describe Prototype do
  describe 'associations' do
    let(:proto) { create(:prototype) }
    let(:user){ create(:user) }

    describe 'with user' do
      let!(:user) { attributes_for(:user) }
      let!(:proto) {attributes_for(:prototype)}
      it 'is associated with an user' do
        proto.merge!(user: user)
        expect(proto[:user]).to eq user
      end
    end

    describe 'with comments' do
      it 'deletes the comments when Prototype is deleted' do
        comment = create(:comment, prototype: proto)
        expect { proto.destroy }.to change{ Comment.count }.by(-1)
      end
    end

    describe 'with likes' do
      it 'deletes the likes when Prototype is deleted' do
        like = create(:like, prototype: proto)
        expect { proto.destroy }.to change { Like.count }.by(-1)
      end
    end
  end

  describe '#create' do
    it 'is invalid without a title' do
      proto = build(:prototype, title: nil)
      proto.valid?
      expect(proto.errors[:title]).to include ("can't be blank")
    end
  end

  describe 'liked_by?(user)' do
    describe 'when liked_by an user' do
      it 'returns true' do
        user = create(:user)
        like = create(:like, user: user)
        liked_by = Like.find_by(user_id: user.id)
        expect(liked_by).to be_truthy
      end
    end

    describe 'when not liked_by an user' do
      it 'returns nil' do
        user = create(:user)
        like = create(:like, user: nil)
        liked_by = Like.find_by(user_id: user.id)
        expect(liked_by).to be_nil
      end
    end
  end

  describe '#set_sub_thumbnails' do
      let(:proto){create(:prototype)}
      let!(:sub_imgs) {
        [
          create(:protoimage, prototype: proto, role: :sub),
          create(:protoimage, prototype: proto, role: :sub),
          create(:protoimage, prototype: proto, role: :sub)
        ]
      }
      it 'returns an array containing sub_images' do
      expect(sub_imgs).to include(sub_imgs[0], sub_imgs[1], sub_imgs[2])
    end
  end
end
