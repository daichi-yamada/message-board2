class MessagesController < ApplicationController
  before_action :set_message, only:[:edit, :update, :destroy]
  def index
    @message=Message.new
    @messages=Message.all
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      #保存に成功した場合はTOPへリダイレクト
      redirect_to root_path ,notice:'編集完了'
    else
      render 'edit'
    end
  end
  
  def create
    @message=Message.new(message_params)
    if @message.save
      redirect_to root_path , notice:'メッセージをメッセージを保存しました'
    else
      @messages=Message.all
      flash.now[:alert]="メッセージの保存に失敗しました"
      render'index'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice:"メッセージ削除しました"
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  
  def set_message
    @message=Message.find(params[:id])
  end
end
