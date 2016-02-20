require 'rails_helper'

describe "labs api", :type => :request do
  describe "GET /api/labs" do
    let!(:lab1){FG.create(:lab)}
    let!(:lab2){FG.create(:lab)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/labs"

        expect(response.status).to eq 200
      end

      it "is an instance of Array" do
        get "/api/labs"

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Array
      end

      it "return two labs in the first page" do
        get "/api/labs"

        body = JSON.parse(response.body)
        expect(body.count).to eq 2
      end

      it "return zero labs in the second page" do
        get "/api/labs?page=2"

        body = JSON.parse(response.body)
        expect(body.count).to eq 0
      end
    end
  end

  describe "GET /api/labs/:id" do
    let!(:lab){FG.create(:lab)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/labs/"+lab.id.to_s

        expect(response.status).to eq 200
      end

      it "is an instance of Hash" do
        get "/api/labs/"+lab.id.to_s

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Hash
      end

      it "is eaual lab" do
        get "/api/labs/"+lab.id.to_s

        body = JSON.parse(response.body)
        expect(body["id"]).to eq lab.id
        expect(body["title"]).to eq lab.title
        expect(body["description"]).to eq lab.description
        expect(body["url"]).to eq lab.url
        expect(body["image"]).to eq lab.image
      end
    end

    context "When not Valid" do
      it "return 404 NotFound" do
        get "/api/labs/100"

        expect(response.status).to eq 404
      end
    end
  end
end