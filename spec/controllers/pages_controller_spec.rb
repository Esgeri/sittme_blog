require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #welcome' do
    it "renders the :welcome template" do
      get :welcome
      expect(response).to render_template(:welcome)
    end
  end

  describe 'GET #about' do
    it "renders the :about template" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe 'GET #json_data' do
    it "returns http status" do
      get :json_data, format: :json
      expect(response).to have_http_status(200)
    end

    it "returns a json file" do
      get :json_data, format: :json
      expect(response.headers['Content-Type']).to match('application/json')
    end

    it 'returns content' do
      create_list(:user, 3)

      get :json_data, format: :json

      schema = {
          "$schema": "http://json-schema.org/draft-04/schema#",
          "type": "object",
          "properties": {
            "data": {
              "type": "array",
              "items": [
                {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string"
                    },
                    "type": {
                      "type": "string"
                    },
                    "attributes": {
                      "type": "object",
                      "properties": {
                        "username": {
                          "type": "string"
                        },
                        "email": {
                          "type": "string"
                        }
                      },
                      "required": [
                        "username",
                        "email"
                      ]
                    },
                    "relationships": {
                      "type": "object",
                      "properties": {
                        "articles": {
                          "type": "object",
                          "properties": {
                            "data": {
                              "type": "array",
                              "items": {}
                            }
                          },
                          "required": [
                            "data"
                          ]
                        }
                      },
                      "required": [
                        "articles"
                      ]
                    }
                  },
                  "required": [
                    "id",
                    "type",
                    "attributes",
                    "relationships"
                  ]
                }
              ]
            }
          },
          "required": [
            "data"
          ]
      }

      begin
        result = JSON::Validator.validate!(schema, @response.body)
        expect(result).to be true
      rescue JSON::Schema::ValidationError => e
        e.message
      end

      expect(response.body).not_to be_empty

      test_json_data = {
        "data":[
          {
            "id":"30",
            "type":"users",
            "attributes":{
              "username":"TestUser",
              "email":"user30@test.com"
            },
            "relationships":{
              "articles":{"data":[]}
            }
          },
          {
            "id":"31",
            "type":"users",
            "attributes":{
              "username":"TestUser",
              "email":"user31@test.com"
            },
            "relationships":{
              "articles":{"data":[]}
            }
          },
          {
            "id":"32",
            "type":"users",
            "attributes":{
              "username":"TestUser",
              "email":"user32@test.com"
            },
            "relationships":{
              "articles":{"data":[]}
            }
          }
        ]
      }.to_json

      expect(response.body).to eq(test_json_data)
    end
  end
end
