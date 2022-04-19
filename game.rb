
def rollTwoDice
    die1 = rand(6) + 1
    die2 = rand(6) + 1
    return  die1 + die2
end

def continuedGame(firstRoll)
    while true
        latterRoll = rollTwoDice
        if latterRoll == firstRoll
            return "win"
        elsif latterRoll == 7
            return "loss"
        end
    end

end

def getStats(numRolls = 100000000)
    numWins = 0
    numLosses = 0
    numNeuts = 0
    numRolls.times do |i|
        if i % (numRolls / 10) === 0
            p "#{i / (numRolls / 10)}0% done!"
        end
        firstRoll = rollTwoDice
        if [7,11].include?(firstRoll)
            numWins += 1
        elsif [2,3].include?(firstRoll)
            numLosses += 1
        elsif [12].include?(firstRoll)
            numLosses += 1
            numNeuts += 1
        else
            gameResult = continuedGame(firstRoll)
            case gameResult
            when "win"
                numWins += 1
            when "loss"
                numLosses += 1
            else
                raise "GAME ERROR"
            end
        end
    end
    p "#{numWins} wins"
    p "#{numLosses} losses"
    p "#{numNeuts} losses by a 12"

    p "#{numWins / numRolls.to_f} chances of win"
    p "#{numLosses / numRolls.to_f} chances of loss"
    p "#{numNeuts / numRolls.to_f} chances of loss by a 12"
end

getStats