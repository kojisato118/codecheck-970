require 'rails_helper'

describe "contens api", :type => :request do
  describe "GET /api/qiitas" do
    let!(:qiita1){FG.create(:qiita_item)}
    let!(:qiita2){FG.create(:qiita_item)}
    let!(:project1){FG.create(:project)}
    let!(:project2){FG.create(:project)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/contents"

        expect(response.status).to eq 200
      end

      it "is an instance of Array" do
        get "/api/contents"

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Array
      end

      it "return four contents in the first page" do
        get "/api/contents"

        body = JSON.parse(response.body)
        expect(body.count).to eq 4
      end

      it "return zero qiitas in the second page" do
        get "/api/contents?page=2"

        body = JSON.parse(response.body)
        expect(body.count).to eq 0
      end
    end
  end
end