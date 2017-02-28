module Admin::MessagesHelper
  def message_weight message
    message.status == false ? 'font-weight:bold' : 'font-weight:normal'
  end
end
