require 'rails_helper'

RSpec.describe Lab, type: :model do
  # check validations
  describe "Validataion" do
    context "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:url) }
      it { is_expected.to validate_presence_of(:image) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end
