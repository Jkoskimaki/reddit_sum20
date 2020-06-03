class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :destroy, :update]
  before_action :set_sub
  #want to be set for every single action ... all routes for topic have a sub_id, e.g.

  # Topic --> sub.topics

  def index
    @topics = @sub.topics
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = @sub.topics.new
    render partial: "form"
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to sub_topics_path(@sub)
  end


private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_sub
    @sub = Sub.find(params[:sub_id])
  end

end

