require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'


RSpec.describe Deck do
  
  it "creates new Deck object" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)   
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    
    expect(cards).to be_an(Array)
    expect(cards).to eq([card1, card2, card3])
   
  end

it "gives rank of cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)   
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)

  expect(deck.rank_of_card_at(0)).to eq(12)
  expect(deck.rank_of_card_at(2)).to eq(14)

end

it "gives high ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)   
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card3]
  deck = Deck.new(cards)

  expect(deck.high_ranking_cards).to be_an(Array)
  expect(deck.high_ranking_cards).to eq([card1, card3]) 
end

it "gives percent of high ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)   
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  
  expect(deck.percent_high_ranking).to be_a(Float)
  expect(deck.percent_high_ranking).to eq(66.67)
end

it "removes a card" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)   
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  
  expect(deck.remove_card).to eq(card1)
 # expect(deck.remove_card).to eq(@rank=12, @suit=diamond, @value="Queen")
  
  #deck = Deck.new(cards)
  expect(cards).to be_an(Array)
  expect(cards).to eq([card2, card3])
  
  expect(deck.high_ranking_cards).to be_an(Array)
  expect(deck.high_ranking_cards).to eq([card3]) 
  
  expect(deck.percent_high_ranking).to be_a(Float)
  expect(deck.percent_high_ranking).to eq(50.00)
end

it "adds new card to deck" do
 # card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)   
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card2, card3]
  deck = Deck.new(cards)
  
  card4 = Card.new(:club, '5', 5)
  deck.add_card(card4)

  deck = Deck.new(cards)
  expect(cards).to be_an(Array)
  expect(cards).to eq([card2, card3, card4])

  expect(deck.high_ranking_cards).to be_an(Array)
  expect(deck.high_ranking_cards).to eq([card3]) 
  expect(deck.percent_high_ranking).to eq(33.33)

end
end
