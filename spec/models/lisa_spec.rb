require 'rails_helper'

RSpec.describe Lisa, type: :model do
  # check validations
  describe "Validataion" do
    context "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:lisa_id) }
      it { is_expected.to validate_presence_of(:url) }
      it { is_expected.to validate_presence_of(:image) }
    end

    context "uniquness" do
      let!(:lisa){FG.build(:lisa).save!(validate: false)}
      it { is_expected.to validate_uniqueness_of(:lisa_id) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end
