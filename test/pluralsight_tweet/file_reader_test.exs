defmodule FileReaderTest do
	use ExUnit.Case

	import Mock
	import PluralsightTweet.FileReader
	import PluralsightTweet.TweetPicker

	test "Passing a file should return a string" do
		file_path = Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
		str = get_strings_to_tweet(file_path)

		assert str != nil
	end

	test "String must be shorter than 40 characaters" do
		file_path = Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "test/too_long.txt")
		str = get_strings_to_tweet(file_path)

		assert str = "short"
	end

	test "Empty strings should return empty string" do
		str = pick_string("")

		assert str == ""
	end

	test "The string should be trimeed" do
		with_mock File, [read!: fn(_) -> " ABC " end] do
			str = get_strings_to_tweet("this file doesn't exist.txt")

			assert str == "ABC"
		end
	end
end