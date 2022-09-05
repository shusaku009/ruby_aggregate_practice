require 'json'

class HighMotivationUserAggregator
  attr_accessor :channel_names

  def initialize(channel_names)
    @channel_names = channel_names
  end

  # 実装してください
  def exec
    times_post = @channel_names.map do |channel_name|
      #jsonファイルを読み込みんで変数に代入
      channel = load(channel_name)
      #jsonファイルの変数"messages"を呼び出し変数"message"に代入
      message = channel["messages"]
      #変数"message"の要素数を調べる
      message_count = message.length
      #出力するためのハッシュを作成
      {
        channel_name: channel_name,
        message_count: message_count
      }
    end
    #変数execの配列を多い順に並べる
      times_post.max_by(3) {|x| x[:message_count]}
  end

  def load(channel_name)
    dir = File.expand_path("../data/#{channel_name}", File.dirname(__FILE__))
    file = File.open(dir)
    JSON.load(file)
  end
end