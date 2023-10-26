class BugsController < ApplicationController
   before_action :set_bug, only:%i[ update destroy]

 def index
    @bugs = Bug.all
    respond_to do |format|
      format.html
      format.turbo_stream
      format.json { render json: @bugs}
 end
end

 def create 
    @bug = Bug.create(bug_params)
    respond_to do |format|
      if @bug.save
        format.turbo_stream
        format.html { redirect_to bugs_path, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location; @bug }
    else 
      
      render json: bug.errors, status: 422
    end
 end

 def update 
   bug = Bug.find(params[:id])
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
      render json: bug.errors

    end
 end 

 private
 def bug_params
    params.require(:bug).permit(:description, :priority, :assignee)
 end

end
