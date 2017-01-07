defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def create_hand(hand_size) do
    create_deck
    |> shuffle
    |> deal(hand_size)
  end

  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  def contains?(cards, hand) do
    Enum.member?(cards, hand)
  end

  def deal(cards, hand_size) do
    Enum.split(cards, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def read(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "#{reason}: #{file_name} doesn't exists in this directory"
    end
  end

end
