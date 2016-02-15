require 'rails_helper'

describe "lisas api", :type => :request do
  describe "GET /api/lisas" do
    let!(:lisa1){FG.create(:lisa)}
    let!(:lisa2){FG.create(:lisa)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/lisas"

        expect(response.status).to eq 200
      end

      it "is an instance of Array" do
        get "/api/lisas"

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Array
      end

      it "return two lisas in the first page" do
        get "/api/lisas"

        body = JSON.parse(response.body)
        expect(body.count).to eq 2
      end

      it "return zero lisas in the second page" do
        get "/api/lisas?page=2"

        body = JSON.parse(response.body)
        expect(body.count).to eq 0
      end
    end
  end

  describe "GET /api/lisas/:id" do
    let!(:lisa){FG.create(:lisa)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/lisas/"+lisa.id.to_s

        expect(response.status).to eq 200
      end

      it "is an instance of Hash" do
        get "/api/lisas/"+lisa.id.to_s

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Hash
      end

      it "is eaual lisa" do
        get "/api/lisas/"+lisa.id.to_s

        body = JSON.parse(response.body)
        expect(body["id"]).to eq lisa.id
        expect(body["lisa_id"]).to eq lisa.lisa_id
        expect(body["title"]).to eq lisa.title
        expect(body["description"]).to eq lisa.description
        expect(body["url"]).to eq lisa.url
        expect(body["image"]).to eq lisa.image
      end
    end

    context "When not Valid" do
      it "return 404 NotFound" do
        get "/api/lisas/100"

        expect(response.status).to eq 404
      end
    end
  end
end