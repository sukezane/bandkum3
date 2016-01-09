require 'pusher'

Pusher.url = "https://7cadebb65622e49e0891:d364bc96b97a34a5d397@api.pusherapp.com/apps/165332"

# Pusher.trigger('test_channel', 'my_event', {
#   message: 'hello world'
# })
Pusher.logger = Rails.logger