require 'tweetstream'
require File.join(File.dirname(__FILE__), 'tweet_store')

STORE = TweetStore.new

TweetStream.configure do |config|
  config.consumer_key       = 'eI8jgoYG2hwh9RL1607UYSjIq'
  config.consumer_secret    = 'UUqAlHT88KAykdBLT9seV7e4AoT9OIlUXwko2AxtclQFFnxpQj'
  config.oauth_token        = '59725667-0LG1DaD9sKbTc6uldws5m2rJvlgUR8peRWMAsgpGs'
  config.oauth_token_secret = 'wSJS4dJdpXMa0A0xj7gzEI11Vr0vPj5Nqvf4YwHu5qwQz'
  config.auth_method        = :oauth
end

#TweetStream::Client.new.track('#michaeljordan','#nba', '#philippines', '#johnloydcruz', '#romance') do |status|
#'#NiallYourBodyIsWonderful',
#'#earthquake',
#'#PSYPagtuwidSaNakaraan',
#'#Ferguson',
#'#OTWOLArrival'
#) do |status|
  # Ignore replies. Probably not relevant in your own filter app, but we want
  # to filter out funny tweets that stand on their own, not responses.
#  if status.text !~ /^#\w+/
    # Yes, we could just store the Status object as-is, since it's actually just a
    # subclass of Hash. But Twitter results include lots of fields that we don't
    # care about, so let's keep it simple and efficient for the web app.
#TweetStream::Client.new.track('#cebu','@daavve','@cebu') do |status|
#TweetStream::Client.new.sitestream(['622305590690234373'], :followings => true) do |status|
#TweetStream::Client.new.userstream do |status|
TweetStream::Client.new.track('#cebu', '#cebutraffic','#cebuhighway', '#cebucity','#itsmorefuninthephilippines','#manila','#celebrity','#ncaa','#nba','#lifehack') do |status|
  @x =   STORE.push({
     'id' => status.id,
      'text' => status.text,
      'username' => status.user.screen_name,
      'userid' => status.user.id,
      'name' => status.user.name,
      'profile_image_url' => status.user.profile_image_url,
      'created_at' => status.created_at,
      'received_at' => Time.new.to_i
    })

    puts @x.inspect
#  end
end
