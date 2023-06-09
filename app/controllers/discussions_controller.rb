# frozen_string_literal: true

class DiscussionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion, only: %i[edit update destroy]

  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to discussions_path, notice: 'Discussion created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to discussions_path, notice: 'Discussion updated' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discussion.destroy!
    redirect_to discussions_path, status: :see_other, notice: 'Discussion deleted'
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:name, :pinned, :closed)
  end
end
