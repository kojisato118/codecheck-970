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
  end

  # check relations such as has_many
  describe "relation" do

  end
end
