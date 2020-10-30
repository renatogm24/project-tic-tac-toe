class Cell
    attr_reader :xaxis, :yaxis, :value
    attr_writer :value

    def initialize(xaxis, yaxis, value)
        @xaxis = xaxis
        @yaxis = yaxis
        @value = value
    end
end

class Tictactoe
    attr_accessor :cells

    def initialize
        self.cells = {}
        value = 1
        for y in 1..3
            for x in 1..3
                newcell = Cell.new(x, y, value)
                p newcell
                self.cells["#{x},#{y}"] = newcell
                value += 1
            end
        end
    end

    def printTictactoe
        for y in 1..3
            for x in 1..3
                line = self.cells["#{x},#{y}"].value.to_s + "|"
                print line
            end
            print "\n"
            puts "------"
        end
    end

    def isThereAWinners

    end

    def changeValue(value)
        puts self.cells
        puts self.cells.key(value)
        self.cells[self.cells.key(value)] = "X"
    end
end

TictactoeMain = Tictactoe.new
TictactoeMain.printTictactoe
TictactoeMain.changeValue(1)