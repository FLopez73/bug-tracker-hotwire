require 'rails_helper'

RSpec.describe "Bugs", type: :request do
  describe "GET /index" do
    it "gets a list of bugs" do
      Bug.create(
        description: 'broken link',
        priority: 'High',
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
          priority: 'Low',
          assignee: 'Borja' 
        }
      }

      post '/bugs', params: bug_params 

      expect(response).to have_http_status(200)

      bug = Bug.first 

      expect(bug.assignee).to eq 'Borja'
    end
  end

  describe "PATCH/update" do
    it "updates existing bug" do 
      bug_params = {
        bug: {
          description: 'slow response time',
          priority: 'Low',
          assignee: 'Borja' 
        }
      }

      post '/bugs', params: bug_params
      bug = Bug.first 
      update_params = {
        bug: {
          description: 'site crashing',
          priority: 'High',
          assignee: 'Steve' 
        }
      }
      patch "/bugs/#{bug.id}", params: update_params
      expect(response).to have_http_status(200)
      new_bug = Bug.first
      expect(new_bug.assignee).to eq "Steve"
    
    end
  end
    
    describe "DELETE/destroy" do 
      it "deletes existing bug" do  
        bug_params = {
          bug: {
          description: 'broken link',
          priority: 'High',
          assignee: 'Ben' 
        }
      }
      post '/bugs', params: bug_params
        bug = Bug.first 
        delete_params = {
        bug: {
          description: 'broken link',
          priority: 'High',
          assignee: 'Ben' 
        }
      }
      delete "/bugs/#{bug.id}", params: delete_params
      expect(response).to have_http_status(200)
      expect(Bug.exists?(bug.id)).to be_falsy
     end
   end

   describe "cannot update a cat without valid attributes" do
    it "cannot update a bug without a description" do
      bug = Bug.first 
        bug_params = {
          bug: {
          description: 'broken link',
          priority: 'High',
          assignee: 'Steve' 
        }
      }
      post '/bugs', params: bug_params 
      bug = Bug.first 
      update_params = {
        bug: {
        description: '',
        priority: 'High',
        assignee: 'Steve' 
      }
    }
    patch "/bugs/#{bug.id}", params: update_params
    bug = JSON.parse(response.body)
    expect(response).to have_http_status(422)
    expect(bug['description']).to include "can't be blank"

  end 
 end
end
