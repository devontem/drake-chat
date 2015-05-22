class CommentsController < ApplicationController
    def new 
       @comment = Comment.new #prepares a new comment to be made
       @comments = Comment.order('created_at DESC')
    end
    
    def index
        #/comments pages
       redirect_to root_url 
    end
    
    def show
        #/comments/:id page
        #@post = Post.find(params[:id])
        redirect_to root_url
    end
    
    # def create
    #     respond_to |format|
    #         if current_user
    #           @comment = current_user.comments.new(comment_params) #creates a new comment for the current_user
    #             if @comment.save
    #               flash[:success] = 'Your comment was successfully posted!'
    #             else
    #                 flash[:error] = "Your comment cannot be saved."
    #             end
    #             format.html {redirect_to root_url}
    #             format.js
    #         else
    #             format.html
    #             format.js {render nothing: true} #doesn't load the js from create.js.erb
    #         end
    #     end
    # end
    
    def create
      respond_to do |format|
        if current_user
          @comment = current_user.comments.build(comment_params)
          if @comment.save
            flash.now[:success] = 'Your comment was successfully posted!'
          else
            flash.now[:error] = 'Your comment cannot be saved.'
          end
          format.html {redirect_to root_url}
          format.js
        else
          format.html {redirect_to root_url}
          format.js {render nothing: true}
        end
      end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = "Comment Deleted!"
        redirect_to root_url
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body) #returns a copy of a 'comment' only with the outlined keys
    end
end
