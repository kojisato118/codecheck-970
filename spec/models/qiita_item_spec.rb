require 'rails_helper'

RSpec.describe QiitaItem, type: :model do
  # check validations
  describe "Validataion" do
    let!(:qiita_item){FG.build(:qiita_item).save!(validate: false)}
    context "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:qiita_item_id) }
      it { is_expected.to validate_presence_of(:url) }
    end

    context "uniquness" do
      it { is_expected.to validate_uniqueness_of(:qiita_item_id) }
    end

    context "format" do
      it { is_expected.to allow_value("https://sprint.code-check.io/").for(:url) }
      it { is_expected.not_to allow_value("javascript:alert('XSS');//http://bitarts.jp/").for(:url) }

      it { is_expected.to allow_value("http://cdn.qiita.com/assets/siteid-reverse-04252f9a0a01f3a6d03eefefb2a30602e854bf7a4d237969a35600c1bbc3f783.png").for(:image) }
      it { is_expected.to allow_value("/images/medium/no_image.png").for(:image) }
      it { is_expected.not_to allow_value("http://qiita.com/").for(:image) }
      it { is_expected.not_to allow_value("/images/medium/test.png").for(:image) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end
