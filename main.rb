def print_board(board)
  p " #{board[6]} | #{board[7]} | #{board[8]} "
  p '-----------'
  p " #{board[3]} | #{board[4]} | #{board[5]} "
  p '-----------'
  p " #{board[0]} | #{board[1]} | #{board[2]} "
end

$picks = {
  [1, 2, 3] => [],
  [4, 5, 6] => [],
  [7, 8, 9] => [],
  [1, 4, 7] => [],
  [2, 5, 8] => [],
  [3, 6, 9] => [],
  [1, 5, 9] => [],
  [3, 5, 7] => [],
}

$board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

$picker = 'X'

def pick_spot
  puts "#{$picker} pick a number 1..9"
  spot = gets.chomp.to_i - 1
  if $board[spot] == ' '
    $board[spot] = $picker
    $picks.keys.each do |pattern|
      $picks[pattern] << $picker if pattern.include?(spot + 1)
    end
  else
    $picker = $picker == 'X' ? 'O' : 'X'
  end
end

def check_game_over
  system 'clear'
  print_board $board
  if $picks.values.any? { |pattern| pattern == %w[X X X] }
    puts 'X is the Winner!'
    exit
  elsif $picks.values.any? { |pattern| pattern == %w[O O O] }
    puts 'O is the Winner!'
    exit
  elsif $board.all? { |spot| spot != ' ' }
    puts 'It\'s a Tie!'
    exit
  end
end

def game
  pick_spot
  check_game_over
  $picker = $picker == 'X' ? 'O' : 'X'
  game
end

game
