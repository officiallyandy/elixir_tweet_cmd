defmodule FileReaderTest do
	use ExUnit.Case

	test "Passing a file should return a string" do
		file_path = Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
		str = PluralsightTweet.FileReader.get_strings_to_tweet(file_path)

		assert str != nil
	end

	test "String must be shorter than 40 characaters" do
		file_path = Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "test/too_long.txt")
		str = PluralsightTweet.FileReader.get_strings_to_tweet(file_path)

		assert str = "short"
	end
end