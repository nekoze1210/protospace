require 'rails_helper'

describe 'Protoimage' do
  describe '#create' do
    it 'has a valid factory' do
      thumb = build(:protoimage, :main)
      expect(thumb).to be_valid
    end

    it 'is invalid without a thumbnail' do
      thumb = build(:protoimage, thumbnail: nil)
      thumb.valid?
      expect(thumb.errors[:thumbnail]).to include ("can't be blank")
    end

    it 'has the wrong content format' do
      thumb = build(:protoimage, thumbnail: fixture_file_upload("img/sample.rb", 'image/rb') )
      thumb.valid?
      expect(thumb.errors[:thumbnail][0]).to include ("You are not allowed to upload \"rb\" files, allowed types: jpg, jpeg, gif, png")
    end
  end

end
