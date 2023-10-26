class BugsController < ApplicationController
   before_action :set_bug, only:%i[ update destroy]

 def index
    @bugs = Bug.all
    respond_to do |format|
      format.html
      format.turbo_stream
 end
end

 def create 
    @bug = Bug.create(bug_params)
    respond_to do |format|
      if @bug.save
        format.turbo_stream
        format.html { redirect_to bugs_path, notice: 'Bug was successfully created.' }
    else 
         format.turbo_stream { render :new, status: :unprocessable_entity }
         format.html { render :new, status: :unprocessable_entity }
      end 
     end
   end
         
      

 def update 
   respond_to do |format|
   if @bug.update(bug_params)
    format.turbo_stream
    format.html { redirect_to bugs_path, notice: 'Bug was successfully updated' }
   else 
    format.turbo_stream { render :edit, status: :unprocessable_entity }
    format.html { render :edit, status: :unprocessable_entity }   
    end
   end
 end

 def destroy 
   @bug.destroy
   respond_to do |format|
      format.turbo_stream
      format.html { redirect_to bugs_path, notice: 'Bug was successfully deleted'}
    end
 end 

 private
  def set_bug
    @bug = Bug.find(params[:id])
  end

  def bug_params
     params.require(:bug).permit(:description, :priority, :assignee)
  end

end
