require 'rails_helper'

RSpec.describe QiitaItem, type: :model do
  # check validations
  describe "Validataion" do
    describe "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:qiita_item_id) }
      it { is_expected.to validate_presence_of(:url) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end
