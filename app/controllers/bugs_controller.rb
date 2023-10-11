class BugsController < ApplicationController

 def index
    bugs = Bug.all
    render json: bugs
 end

 def create 
    bug = Bug.create(bug_params)
    if bug.valid? 
    render json: bug
    else 
      render json: bug.errors, status: 422
    end
 end

 def update 
   bug = Buf.find(params[:id])
   bug.update(bug_params)
   if bug.valid?
      render json: bug
   else 
      render json: bug.errors, status:422 
   end
 end

 def destroy 
   bug = Bug.find(params[:id])
   if bug.destroy 
      render json: bug
   else 
      render json: errors

   end
 end 

 private
 def bug_params
    params.require(:bug).permit(:description, :priority, :assignee)
 end

end
