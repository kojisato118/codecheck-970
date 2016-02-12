require 'rails_helper'

describe "projects api", :type => :request do
  describe "GET /api/projects" do
    let!(:project1){FG.create(:project)}
    let!(:project2){FG.create(:project)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/projects"

        expect(response.status).to eq 200
      end

      it "is an instance of Array" do
        get "/api/projects"

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Array
      end

      it "return all projects" do
        get "/api/projects"

        body = JSON.parse(response.body)
        expect(body.count).to eq 2
      end
    end
  end

  describe "GET /api/projects/:id" do
    let!(:project){FG.create(:project)}
    context "When Valid" do
      it "return 200 OK" do
        get "/api/projects/"+project.id.to_s

        expect(response.status).to eq 200
      end

      it "is an instance of Hash" do
        get "/api/projects/"+project.id.to_s

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Hash
      end

      it "is eaual project" do
        get "/api/projects/"+project.id.to_s

        body = JSON.parse(response.body)
        expect(body["id"]).to eq project.id
        expect(body["title"]).to eq project.title
        expect(body["description"]).to eq project.description
        expect(body["url"]).to eq project.url
      end
    end

    context "When not Valid" do
      it "return 404 NotFound" do
        get "/api/projects/100"

        expect(response.status).to eq 404
      end
    end
  end

  describe "POST /api/projects" do
    let(:title){Faker::Name.title}
    let(:description){Faker::Lorem.paragraph}
    let(:url){Faker::Internet.url}
    context "When Valid" do
      it "return 201 Created with all params" do
        post "/api/projects", {title: title, description: description, url: url}, {}

        expect(response.status).to eq 201
      end

      it "return sama data with params" do
        post "/api/projects", {title: title, description: description, url: url}, {}

        body = JSON.parse(response.body)
        expect(body["title"]).to eq title
        expect(body["description"]).to eq description
        expect(body["url"]).to eq url
      end

      it "can create without url" do
        post "/api/projects", {title: title, description: description}, {}

        expect(response.status).to eq 201
      end
    end

    context "When not Valid" do
      it "can not create without title" do
        post "/api/projects", {description: description, url: url}, {}

        expect(response.status).to eq 400
      end

      it "can not create without description" do
        post "/api/projects", {title: title, url: url}, {}

        expect(response.status).to eq 400
      end
    end
  end

  describe "DELETE /api/projects/:id" do
    context "When Valid" do
      let(:project){FG.create(:project)}
      before(:each) do
        project
      end
      it "return 200 OK" do
        delete "/api/projects/"+project.id.to_s

        expect(response.status).to eq 200
      end

      it "is an instance of Hash" do
        delete "/api/projects/"+project.id.to_s

        body = JSON.parse(response.body)
        expect(body).to be_an_instance_of Hash
      end

      it "is eaual project" do
        delete "/api/projects/"+project.id.to_s

        body = JSON.parse(response.body)
        expect(body["id"]).to eq project.id
        expect(body["title"]).to eq project.title
        expect(body["description"]).to eq project.description
        expect(body["url"]).to eq project.url
      end
    end

    context "When not Valid" do
      it "return 404 NotFound" do
        delete "/api/projects/100"

        expect(response.status).to eq 404
      end
    end
  end
end