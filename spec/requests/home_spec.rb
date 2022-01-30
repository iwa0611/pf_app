require 'rails_helper'

RSpec.describe "HomesController", type: :request do
  
  before do
    get hobbyspot_path
  end

  describe "トップページを開いた時" do
    it "ページが表示される" do
      expect(response.status).to eq 200
    end
  end
end
