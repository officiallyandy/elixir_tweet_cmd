defmodule PluralsightTweet.TweetPicker do
	def pick_string(str) do
    	str
    	|> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 140)
        |> Enum.random()
    end
end