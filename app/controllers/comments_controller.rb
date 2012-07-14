class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index    
    @articles = Admin.where(:published => 1).paginate page: params[:page], order: 'data_create desc', per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
   
    @articles = Admin.find(params[:id])
    @comments_q = Comment.find_all_by_post_id(params[:id], :order => "data_p desc").paginate page: params[:page], order: 'data_p desc', per_page: 5
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    Time.zone = "Kyiv"
    @comment.data_p = Time.zone.now
    respond_to do |format|
      if @comment.save
        format.html { redirect_to request.env['HTTP_REFERER'], notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html {redirect_to request.env['HTTP_REFERER'], notice: "Please leave your comment." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
end
