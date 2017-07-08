defmodule PluralsightTweet.FileReader do
    def get_strings_to_tweet(path) do
        File.read!(path)
        |> PluralsightTweet.TweetPicker.pick_string
    end
end