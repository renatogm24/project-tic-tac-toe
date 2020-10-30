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
        for y in 1..3
            for x in 1..3
                newcell = Cell.new(x, y, value)
                p newcell
                self.cells << newcell
                value += 1
            end
        end
    end

    def printTictactoe
        self.cells.each_with_index do |cell, idx|          
            line = cell.value.to_s + "|"
            print line
            if (idx+1) % 3 == 0
                print "\n"
                puts "------" 
            end            
        end
    end

    def isThereAWinner
        winner = ""
        

    end

    def changeValue(value)
        cell = self.cells.select { |c| c.value == value }
        unless cell.empty?
            cell[0].value = "X"
        end        
    end
end

TictactoeMain = Tictactoe.new
TictactoeMain.printTictactoe
TictactoeMain.changeValue(1)
TictactoeMain.printTictactoe
TictactoeMain.changeValue(2)
TictactoeMain.printTictactoe
TictactoeMain.changeValue(3)
TictactoeMain.printTictactoe