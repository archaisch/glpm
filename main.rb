require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'sanitize'

def thread_link(link)
  link = link.split('/message')
  link = link[1].split('/pg')
  return "thread/#{link[0]}"
end

def thread_title(title)
  title = title
  split_title = title.split('(Pin')
  return (split_title[1] == "ned)" ? '<i class="icon-pushpin"></i> ' + split_title[0] : title)
end

def thread_fields(description)
  thread = {}
  content = description.split('- Poster: ')
  thread[:content] = content[0]
  poster = content[1].split('- Views')
  thread[:poster] = poster[0]
  replies = content[1].split('- Replies ')
  thread[:replies] = replies[1]
  thread
end

def parse feed_url
  feed = Nokogiri::XML(open(feed_url))
  feed.search('item').map do |feed_item|
    item = {}
    #item[:link] = thread_link(feed_item.at('link').text)
    item[:link] = feed_item.at('link').text
    item[:title] = thread_title(feed_item.at('title').text)
    thread = thread_fields(Sanitize.clean(feed_item.at('description').text))
    item[:replies] = thread[:replies]
    item[:poster] = thread[:poster]
    item[:content] = thread[:content]
    item
  end
end

# still needs finished
#def parse_thread feed_url
#  feed = Nokogiri::XML(open(feed_url))
#  feed.search('item').map do |feed_item|
#    item = {}
#    item[:link] = thread_link(feed_item.at('link').text)
#    item[:title] = thread_title(feed_item.at('title').text)
#    thread = thread_fields(Sanitize.clean(feed_item.at('description').text))
#    item[:replies] = thread[:replies]
#    item[:poster] = thread[:poster]
#    item[:content] = thread[:content]
#    item
#  end
#end

get '/' do
  @threads = parse "http://www.godlikeproductions.com/feeds/forums/1"
  @title = "Front"
  erb :index 
end

get '/new' do
  @threads = parse "http://www.godlikeproductions.com/feeds/newthreads"
  @title = "New Threads"
  erb :index
end

#get '/thread/:id' do 
#  full_thread_url = "http://www.godlikeproductions.com/feeds/messages/#{params[:id]}"
#  @posts = parse_thread full_thread_url
#  erb :thread
#end
