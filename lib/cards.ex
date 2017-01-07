defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  def contains?(cards, hand) do
    Enum.member?(cards, hand)
  end
end
