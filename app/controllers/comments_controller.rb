class CommentsController < ApplicationController

  include CommentsHelper
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    body = "New comment on " + @article.title + ": \n\n" + @comment.commenter + ": " + @comment.body

    send_sms(body)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end