defmodule PluralsightTweet.TweetServer do
    use GenServer

    def start_link() do
        # If name not used then a PID has to be specified each time but since this changes with eacn time it runs... better to use an atom.
        GenServer.start(__MODULE__, :ok, name: :tweet_server)
    end

    def init(:ok) do
        {:ok, %{}}
    end

    # Async 
    def handle_cast({:tweet, tweet}, _) do
        PluralsightTweet.Tweet.send(tweet)
        {:noreply, %{}}
    end

    def tweet(tweet) do
        GenServer.cast(:tweet_server, {:tweet, tweet})
    end
end