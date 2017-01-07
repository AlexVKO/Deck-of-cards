defmodule Cards do
  @moduledoc """
    Provides methods for creating and dealing with deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of cards
  """
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

  @doc """
  Determines whether a deck contains a given card

  ## Examples

      iex> Cards.create_deck |> Cards.contains?("Ace of Spades")
      true

      iex> Cards.create_deck |> Cards.contains?("blah")
      false
  """
  def contains?(cards, hand) do
    Enum.member?(cards, hand)
  end

  @doc """
    Devides a deck into a hand and the remainder of the deck
    The `hand_size` argument indicates how many cards should be
    in the hand.

  ## Examples

    iex> deck = Cards.create_deck
    iex> {hand, _deck} = Cards.deal(deck, 1)
    iex> hand
    ["Ace of Spades"]

  """
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
