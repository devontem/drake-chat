class CommentsController < ApplicationController
    def new 
       @comment = Comment.new #prepares a new comment to be made
       @comments = Comment.order('created_at DESC')
    end
    
    def create
        if current_user
           @comment = current_user.comments.new(comment_params) #creates a new comment for the current_user
            if @comment.save
               flash[:success] = 'Your comment was successfully posted!'
            else
                flash[:error] = "Your comment cannot be saved."
            end
        end
        redirect_to root_url
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = "Comment destroyed."
        redirect_to root_url
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body) #returns a copy of a 'comment' only with the outlined keys
    end
end
