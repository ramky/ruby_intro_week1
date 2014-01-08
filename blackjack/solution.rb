#!/usr/bin/env ruby

def calculate_total(cards)
  # cards come in like this - ['S', 'K'],['C', '3']
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

def cards_to_string(cards)
  str_array = []
  cards.each do |suit, card|
    str_array << ( CARDS.key?(card) ? CARDS[card] : card ) + " of #{SUITS[suit]}"
  end
  "[#{str_array.join(', ')}]"
end

SUITS = {
  'H' => 'Hearts',
  'D' => 'Diamonds',
  'S' => 'Spades',
  'C' => 'Clubs'
}

CARDS = {
  'J' => 'Jack',
  'Q' => 'Queen',
  'K' => 'King',
  'A' => 'Ace'
}
suits = %w[H D S C]
cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]

prompt_another_game = false

while true
  prompt_another_game = false
  print "What is the player's name? "
  player_name = gets.chomp.downcase.capitalize
  puts "Hello #{player_name}, Welcome to Blackjack!"

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

  puts "Dealer has #{cards_to_string(dealer_cards)}, for a total of #{dealer_total}"
  puts "#{player_name} has #{cards_to_string(my_cards)}, for a total of #{my_total}"
  puts 

  if my_total == 21
    puts "#{player_name} hit blackjack! #{player_name} wins!"
    prompt_another_game = true
  end

  while my_total < 21 && !prompt_another_game
    print "What would you like to do? Press h to hit or s to stay. "
    input = gets.chomp.downcase
    unless %w[h s].include?(input)
      puts "Error: You must enter h or s."
      next
    end

    # Stay
    if input == 's'
      break
    end

    # Hit
    new_card = deck.pop
    my_cards << new_card
    my_total = calculate_total(my_cards)

    puts "Dealing new card to #{player_name}."
    puts "#{player_name} now has #{cards_to_string(my_cards)}, for a total of #{my_total}"
    puts "Dealer has #{cards_to_string(dealer_cards)}, for a total of #{dealer_total}"
    puts 

    if my_total == 21
      puts "#{player_name} hit blackjack! #{player_name} wins!"
      prompt_another_game = true
    else
      puts "#{player_name} busted!"
      prompt_another_game = true
    end
  end

  # Dealer's turn
  if dealer_total == 21 && !prompt_another_game
    puts "Dealer hit blackjack! #{player_name} loses!"
    prompt_another_game = true
  end

  while dealer_total < 17 && !prompt_another_game
    # Hit
    new_card = deck.pop
    dealer_cards << new_card
    dealer_total = calculate_total(dealer_cards)

    puts "#{player_name} has #{cards_to_string(my_cards)}, for a total of #{my_total}"
    puts "Dealing new card to dealer."
    puts "Dealer now has #{cards_to_string(dealer_cards)}, for a total of #{dealer_total}"
    puts

    if dealer_total == 21
      puts "Dealer hit blackjack!  #{player_name} loses!"
      prompt_another_game = true
    elsif dealer_total > 21
      puts "Dealer busted! #{player_name} wins!"
      prompt_another_game = true
    end
  end

  # Compare hands
  unless prompt_another_game
    if dealer_total > my_total
      puts "#{player_name} loses."
    elsif my_total > dealer_total
      puts "#{player_name} wins."
    else
      puts "Would you believe it? It's a tie!"
    end
  end

  # If prompt_another_game is set correctly, the control should reach here
  print "Do you want to play another game[y/n]? "
  answer = gets.chomp.downcase
  unless %w[y n].include?(answer)
    puts "Error: You must enter y or n."
    next    
  end
  if answer == 'n'
    break
  end
end
