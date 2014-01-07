#!/usr/bin/env ruby

def calculate_total(cards)
  # cards come in like this - ['S', 'K']  ['C', '3']
  total = 0
  array = cards.map{|a| a[1]}
  array.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  # Correct for Aces
  array.select{|e| e == 'A'}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts "Welcome to Blackjack!"
suits = %w[H D S C]
cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]

deck = suits.product cards
deck.shuffle!

my_cards = []
dealer_cards = []

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

dealer_total = calculate_total(dealer_cards)
my_total     = calculate_total(my_cards)

# Show Cards

puts "Dealer has #{dealer_cards[0]} and #{dealer_cards[1]}, for a total of #{dealer_total}"
puts "You have #{my_cards[0]} and #{my_cards[1]}, for a total of #{my_total}"
puts 

if my_total == 21
  puts "Congrats, you hit blackjack! You win!"
  exit
end

while my_total < 21
  print "What would you like to do? Press 1) hit 2) stay. "
  input = gets.chomp.to_i
  unless [1, 2].include?(input)
    puts "Error: you must enter 1 or 2."
    next
  end

  # Stay
  if input == '2'
    break
  end
  # Hit
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  my_cards << new_card
  my_total = calculate_total(my_cards)

  if my_total == 21
    puts "Congrats, you hit blackjack! You win!"
    exit
  else
    puts "Sorry, it looks like you busted!"
    exit
  end
end

# Dealer's turn
if dealer_total == 21
  puts "Congrats, dealer hit blackjack! You lose!"
  exit
end

while dealer_total < 17
  # Hit
  new_card = deck.pop
  puts "Dealing new card to delear: #{new_card}"
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  puts "Dealer total is now: #{dealer_total}"

  if dealer_total == 21
    puts "Sorry, dealer hit blackjack!  You lose!"
    exit
  elsif dealer_total > 21
    puts "Congrats, dealer busted! You win!"
  end
end

# Compare hands

puts "Dealer's cards:"
dealer_cards.each do |card|
  puts "=> #{card}"
end

puts "Your cards:"
my_cards.each do |card|
  puts "=> #{card}"
end

if dealer_total > my_total
  puts "Sorry, you lose."
elsif
  puts "Congrats, you win."
else
  puts "It's a tie."
end