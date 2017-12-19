defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    { hand, _ } = Enum.split(deck, hand_size)

    hand
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = File.read(filename)

    case status do
      :ok -> :erlang.term_to_binary(filename)
      :error -> "That files doesn't exist"
    end
  end
end
