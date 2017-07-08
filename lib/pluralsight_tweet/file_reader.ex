defmodule PluralsightTweet.FileReader do
    @doc """
    	This function takes a file path. Opens the file and randomly pulls out a string to be tweeted out. All strings are trimed and anything more than 40 characters are ignored.

    	iex> PluralsightTweet.FileReader.get_strings_to_tweet("priv/test/too_long.txt") 
    	"short"
    """ 

    def get_strings_to_tweet(path) do
        File.read!(path)
        |> PluralsightTweet.TweetPicker.pick_string
    end
end