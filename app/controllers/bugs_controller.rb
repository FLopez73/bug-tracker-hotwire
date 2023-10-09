class BugsController < ApplicationController

 def index
    bugs = Bug.all
    render json: bugs
 end

 def create 
    bug = Bug.create(bug_params)
    render json: bug
 end

 def update 
   bug = Buf.find(params[:id])
   bug.update(bug_params)

 def destroy 
   bug = Bug.find(params[:id]) 

 private
 def bug_params
    params.require(:bug).permit(:description, :priority, :assignee)
 end

end
