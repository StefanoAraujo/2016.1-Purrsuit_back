require 'spec_helper'
require 'faker'

  describe Deputy do

    it "has a valid factory" do
      expect(build(:deputy)).to be_valid
    end



  end
