class BugsController < ApplicationController

 def index
    bugs = Bug.all
    render json: bugs
 end

 def create 
    bug = Bug.create(bug_params)
    render json: bug
 end


 private
 def bug_params
    params.require(:bug).permit(:description, :priority, :assignee)
 end

end
