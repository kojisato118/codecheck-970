require 'rails_helper'

describe "qiitas api", :type => :request do
  describe "GET /api/qiitas" do
    let!(:qiita1){FG.create(:qiita_item)}
    let!(:qiita2){FG.create(:qiita_item)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/qiitas"

        expect(response.status).to eq 200
      end

      it "is an instance of Array" do
        get "/api/qiitas"

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Array
      end

      it "return two qiitas in the first page" do
        get "/api/qiitas"

        body = JSON.parse(response.body)
        expect(body.count).to eq 2
      end

      it "return zero qiitas in the second page" do
        get "/api/qiitas?page=2"

        body = JSON.parse(response.body)
        expect(body.count).to eq 0
      end
    end
  end

  describe "GET /api/qiitas/:id" do
    let!(:qiita){FG.create(:qiita_item)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/qiitas/"+qiita.id.to_s

        expect(response.status).to eq 200
      end

      it "is an instance of Hash" do
        get "/api/qiitas/"+qiita.id.to_s

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Hash
      end

      it "is eaual qiita" do
        get "/api/qiitas/"+qiita.id.to_s

        body = JSON.parse(response.body)
        expect(body["id"]).to eq qiita.id
        expect(body["qiita_item_id"]).to eq qiita.qiita_item_id
        expect(body["title"]).to eq qiita.title
        expect(body["description"]).to eq qiita.description
        expect(body["url"]).to eq qiita.url
        expect(body["image"]).to eq qiita.image
      end
    end

    context "When not Valid" do
      it "return 404 NotFound" do
        get "/api/qiitas/100"

        expect(response.status).to eq 404
      end
    end
  end
end