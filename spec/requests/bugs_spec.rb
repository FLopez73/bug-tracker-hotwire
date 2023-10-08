require 'rails_helper'

RSpec.describe "Bugs", type: :request do
  describe "GET /index" do
    it "gets a list of bugs" do
      Bug.create(
        description: 'broken link',
        prority: 'High',
        assignee: 'Ben'   
      )

      get '/bugs'

      bug = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(bug.length).to eq 1
    end
  end


  describe "POST /create" do
    it "creates a bug" do
      bug_params = {
        bug: {
          description: 'slow response time',
          prority: 'Low',
          assignee: 'Borja' 
        }
      }

      post '/bugs', params: bug_params 

      expect(response).to have_http_status(200)

      bug = Bug.first 

      expect(bug.assignee).to eq 'Borja'
    end
  end
    
end
