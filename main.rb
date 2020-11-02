class Cell
  attr_accessor :xaxis, :yaxis, :value

  def initialize(xaxis, yaxis, value)
    self.xaxis = xaxis
    self.yaxis = yaxis
    self.value = value
  end
end

class Tictactoe
  attr_accessor :cells

  def initialize
    self.cells = []
    value = 1
    (1..3).each do |y|
      (1..3).each do |x|
        newcell = Cell.new(x, y, value)
        cells << newcell
        value += 1
      end
    end
  end

  def printTictactoe
    cells.each_with_index do |cell, idx|
      line = cell.value.to_s + '|'
      print line
      if (idx + 1) % 3 == 0
        print "\n"
        puts '------'
      end
    end
  end

  def isThereAWinner
    winner = ''
    
    (1..3).each do |x|
      value_compare = 'O'
      count_change = 0
      cells.each do |cell|
        #puts cell.yaxis
        if cell.yaxis == x 
          #puts cell.value
          unless cell.value == value_compare
            value_compare = cell.value
            count_change += 1
            #puts count_change
          end
        end
      end
      if count_change<2 && (value_compare == "X" || value_compare == "O")
        winner = value_compare
        return winner
      end
    end

    (1..3).each do |y|
      value_compare = 'O'
      count_change = 0
      cells.each do |cell|
        #puts cell.yaxis
        if cell.xaxis == y 
          #puts cell.value
          unless cell.value == value_compare
            value_compare = cell.value
            count_change += 1
            #puts count_change
          end
        end
      end
      if count_change<2 && (value_compare == "X" || value_compare == "O")
        winner = value_compare
        return winner
      end
    end

    if self.cells[0].value == self.cells[4].value && self.cells[4].value == self.cells[8].value
      winner = self.cells[0].value
      return winner
    elsif self.cells[2].value == self.cells[4].value && self.cells[4].value == self.cells[6].value
      winner = self.cells[2].value
      return winner
    end

  end  

  def changeValue(value, player)
    cell = cells.select { |c| c.value == value }
    cell[0].value = player unless cell.empty?
  end
end

puts "Start the game Tic Tac Toe. Player X vs Player O"
move_count = 0
TictactoeMain = Tictactoe.new
TictactoeMain.printTictactoe
winner = ""
begin
    player = move_count.even? ? 'X' : 'O'
    puts "Turn of player #{player}"
    print "Enter a numer:"
    number = gets.chomp
    TictactoeMain.changeValue(number.to_i,player)
    TictactoeMain.printTictactoe
    winner = TictactoeMain.isThereAWinner
    move_count += 1
end until winner == "X" || winner == "O"
puts "The winner is the player: #{winner}"