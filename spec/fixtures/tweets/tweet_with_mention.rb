#<Twitter::Tweet:0x00000101d71750
module PixelSorter
  module Mocks
    class Tweet
      def self.first_tweet_with_mentions_and_two_images
        {
          :created_at=>"Sat Oct 11 02:25:36 +0000 2014",
          :id=>520762109127585792,
          :id_str=>"520762109127585792",
          :text=>
          "@pixelsortertest test string with two images and a reference to another user @pixelsorter http://t.co/XkLEuiKUjD",
          :source=>
          "<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
          :truncated=>false,
          :in_reply_to_status_id=>nil,
          :in_reply_to_status_id_str=>nil,
          :in_reply_to_user_id=>2809722444,
          :in_reply_to_user_id_str=>"2809722444",
          :in_reply_to_screen_name=>"pixelsortertest",
          :user=> {
            :id=>1049472978,
            :id_str=>"1049472978",
            :name=>"Way Spurr-Chen",
            :screen_name=>"wayspurrchen",
            :location=>"Austin, TX",
            :url=>"http://wayspurrchen.com/",
            :description=> "Senior JavaScript Instructor at @MakerSquare. Internet enthusiast.",
            :protected=>false,
            :followers_count=>263,
            :friends_count=>474,
            :listed_count=>7,
            :created_at=>"Mon Dec 31 04:26:26 +0000 2012",
            :favourites_count=>1026,
            :utc_offset=>-25200,
            :time_zone=>"Pacific Time (US & Canada)",
            :geo_enabled=>false,
            :verified=>false,
            :statuses_count=>908,
            :lang=>"en",
            :contributors_enabled=>false,
            :is_translator=>false,
            :is_translation_enabled=>false,
            :profile_background_color=>"C0DEED",
            :profile_background_image_url=> "http://abs.twimg.com/images/themes/theme1/bg.png",
            :profile_background_image_url_https=> "https://abs.twimg.com/images/themes/theme1/bg.png",
            :profile_background_tile=>false,
            :profile_image_url=>
            "http://pbs.twimg.com/profile_images/423119873296723968/XJDclhfi_normal.jpeg",
            :profile_image_url_https=>
            "https://pbs.twimg.com/profile_images/423119873296723968/XJDclhfi_normal.jpeg",
            :profile_banner_url=>
            "https://pbs.twimg.com/profile_banners/1049472978/1411142891",
            :profile_link_color=>"0084B4",
            :profile_sidebar_border_color=>"C0DEED",
            :profile_sidebar_fill_color=>"DDEEF6",
            :profile_text_color=>"333333",
            :profile_use_background_image=>true,
            :default_profile=>true,
            :default_profile_image=>false,
            :following=>nil,
            :follow_request_sent=>nil,
            :notifications=>nil
          },
          :geo=>nil,
          :coordinates=>nil,
          :place=>nil,
          :contributors=>nil,
          :retweet_count=>0,
          :favorite_count=>0,
          :entities => {
            :hashtags=>[],
            :symbols=>[],
            :urls=>[],
            :user_mentions=> [
              {
                :screen_name=>"pixelsortertest",
                :name=>"PixelSorter Test",
                :id=>2809722444,
                :id_str=>"2809722444",
                :indices=>[0, 16]
              },
              {
                :screen_name=>"pixelsorter",
                :name=>"Pixel Sorter",
                :id=>2802867446,
                :id_str=>"2802867446",
                :indices=>[77, 89]
              }
            ],
            :media=> [
              {
                :id=>520762107160440832,
                :id_str=>"520762107160440832",
                :indices=>[90, 112],
                :media_url=>"http://pbs.twimg.com/media/BzoeYJnIMAAh296.png",
                :media_url_https=>"https://pbs.twimg.com/media/BzoeYJnIMAAh296.png",
                :url=>"http://t.co/XkLEuiKUjD",
                :display_url=>"pic.twitter.com/XkLEuiKUjD",
                :expanded_url=>
                "http://twitter.com/wayspurrchen/status/520762109127585792/photo/1",
                :type=>"photo",
                :sizes=> {
                  :medium=>{:w=>200, :h=>200, :resize=>"fit"},
                  :large=>{:w=>200, :h=>200, :resize=>"fit"},
                  :thumb=>{:w=>150, :h=>150, :resize=>"crop"},
                  :small=>{:w=>200, :h=>200, :resize=>"fit"}
                }
              }
            ]
          },
          :extended_entities=> {
            :media=> [
              {
                :id=>520762107160440832,
                :id_str=>"520762107160440832",
                :indices=>[90, 112],
                :media_url=>"http://pbs.twimg.com/media/BzoeYJnIMAAh296.png",
                :media_url_https=>"https://pbs.twimg.com/media/BzoeYJnIMAAh296.png",
                :url=>"http://t.co/XkLEuiKUjD",
                :display_url=>"pic.twitter.com/XkLEuiKUjD",
                :expanded_url=>
                "http://twitter.com/wayspurrchen/status/520762109127585792/photo/1",
                :type=>"photo",
                :sizes=> {
                  :medium=> {:w=>200, :h=>200, :resize=>"fit"},
                    :large=>{:w=>200, :h=>200, :resize=>"fit"},
                    :thumb=>{:w=>150, :h=>150, :resize=>"crop"},
                    :small=>{:w=>200, :h=>200, :resize=>"fit"}
                  }
              },
              {
                :id=>520762108150317056,
                :id_str=>"520762108150317056",
                :indices=>[90, 112],
                :media_url=>"http://pbs.twimg.com/media/BzoeYNTIgAAbvGR.jpg",
                :media_url_https=>"https://pbs.twimg.com/media/BzoeYNTIgAAbvGR.jpg",
                :url=>"http://t.co/XkLEuiKUjD",
                :display_url=>"pic.twitter.com/XkLEuiKUjD",
                :expanded_url=>
                "http://twitter.com/wayspurrchen/status/520762109127585792/photo/1",
                :type=>"photo",
                :sizes=> {
                  :small=>{:w=>340, :h=>255, :resize=>"fit"},
                  :large=>{:w=>420, :h=>315, :resize=>"fit"},
                  :medium=>{:w=>420, :h=>315, :resize=>"fit"},
                  :thumb=>{:w=>150, :h=>150, :resize=>"crop"}
                }
              }
            ]
          },
          :favorited=>false,
          :retweeted=>false,
          :possibly_sensitive=>false,
          :filter_level=>"medium",
          :lang=>"en",
          :timestamp_ms=>"1412994336771"
        }
      end
    end
  end
end