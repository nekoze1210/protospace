require 'rails_helper'

describe 'Protoimage' do
  describe 'validation' do
    let(:image) { attributes_for(:protoimage) }
    it 'has a valid factory' do
      expect(image).to be_present
    end
  end

  context '#create' do
    let!(:thumb) { build(:protoimage, thumbnail: nil) }
    it 'is invalid without a thumbnail' do
      thumb.valid?
      expect(thumb.errors[:thumbnail][0]).to include ("can't be blank")
    end

    it 'has the wrong content format' do
      thumb.thumbnail = fixture_file_upload("img/sample.rb", 'image/rb')
      thumb.valid?
      expect(thumb.errors[:thumbnail][0]).to include ("You are not allowed to upload \"rb\" files, allowed types: jpg, jpeg, gif, png")
    end
  end

end
