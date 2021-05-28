require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "#top" do
    it "responds successfully" do
      get :top
      expect(response).to be_successful
    end
  end
end
