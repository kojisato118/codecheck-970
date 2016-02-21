require 'rails_helper'

RSpec.describe Project, :type => :model do
  # check validations
  describe "Validataion" do
    describe "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
    end

    context "format" do
      it { is_expected.to allow_value("https://sprint.code-check.io/").for(:url) }
      it { is_expected.not_to allow_value("javascript:alert('XSS');//http://bitarts.jp/").for(:url) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end