require 'json'

class KindUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  def exec
    times_reactions = @channel_names.map do |channel_name|
      #jsonファイルを読み込みんで変数に代入
      channel = load(channel_name)
      #jsonファイルのキー"messages"を呼び出し変数"reactions"に代入
      reactions = channel[:messages][:reactions]
    end
  end

  def load(channel_name)
    file = File.open(channel_name)
    JSON.load(file)
  end
end