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

    context "format" do
      it { is_expected.to allow_value("https://sprint.code-check.io/").for(:url) }
      it { is_expected.not_to allow_value("javascript:alert('XSS');//http://bitarts.jp/").for(:url) }

      it { is_expected.to allow_value("http://www.sekiya-lab.info/wp-content/uploads/2013/07/SEKIYA-RUN.jpg").for(:image) }
      it { is_expected.to allow_value("/images/medium/no_image.png").for(:image) }
      it { is_expected.not_to allow_value("http://www.sekiya-lab.info").for(:image) }
      it { is_expected.not_to allow_value("/images/medium/test.png").for(:image) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end
