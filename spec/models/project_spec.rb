require 'rails_helper'

RSpec.describe Project, :type => :model do
  # check validations
  describe "Validataion" do
    describe "presence" do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:description) }
    end
  end

  # check relations such as has_many
  describe "relation" do

  end
end