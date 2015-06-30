# 2015-06-29 Jim Nelson

# Making a Markov chain text generator based on this article and Python script http://agiliq.com/blog/2009/06/generating-pseudo-random-text-with-markov-chains-u/

$FilePath = "$($env:USERPROFILE)\Downloads\jeeves.txt"

function Import-FileToMarkov {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=$true, Position = 0)]
        $Path
    )
    $MarkovChain = @{}
    $q = New-Object System.Collections.Queue

    # Load source text file
    Get-Content $Path |
        # Limit input size while developing
        # Select-Object -First 1000 |
        # Since gc is one object per line, do a foreach and split the line, emitting words to pipeline
        ForEach-Object { $_.split() } |
        # each word
        ForEach-Object {
            # FIFO queue the word
            $q.Enqueue($_)
            # If 3 words in the queue, create/add an entry
            if ($q.Count -eq 3) {
                # Pop 3 items from the queue
                $Key = @( $q.Dequeue(), $q.Dequeue() )
                $Value = $q.Dequeue()
                $MarkovChain["$Key"] += [string[]]$Value
                # Put the last two items back in the queue
                $q.Enqueue($Key[1])
                $q.Enqueue($Value)
            }
        }
    $MarkovChain
}

# Builds the Markov chain from a text file input
#$MarkovChain = Import-FileToMarkov $FilePath -Verbose

# Display it
#$MarkovChain

#### THE FOLLOWING is working but not necessarily pretty yet. It needs to be made into a function.

# Import a previously-saved Markov chain
#$MarkovChain = Import-Clixml -Path .\markovchain.xml
$row = ""
# Ugly hack, made this a script block so I can emit the seed words and then emit each new word in the loop and capture the whole sequence in a pipe. But it's a stream.
& {
    # pick a random key name. The hash table didn't seem to like arrays as keys, so they're space-separated values. Split them back into discrete values
    ##### TODO : Pretty sure this is a logc error; should occasionally find a key that's whitespace or punctuation and a word and not split properly, but so far I haven't run across it.
    $temp = (($MarkovChain.GetEnumerator() | Get-Random -Count 1).Name).Split()
    # Create an empty FIFO queue
    $q = New-Object System.Collections.Queue
    # Emit the first two words
    $temp[0]
    $temp[1]
    # Enqueue the words to seed the loop
    $q.Enqueue($temp[0])
    $q.Enqueue($temp[1])

    # For now, looping a specified number of times
    1..1000 | ForEach-Object {
        # This seemed important when I first made this code, but the "if" statement appears unneeded now.
        if ($q.Count -eq 2) {
            # Dequeue two values into the key
            $Key = @( $q.Dequeue(), $q.Dequeue() )
            # Find the key in the chain, pick a random value from the array of values for it
            $Value = ($MarkovChain["$Key"])[(Get-Random $MarkovChain["$Key"].Count)]
            # Emit the value (word)
            $Value
            # Re-enqueue the 2nd key word and the value to make the next key lookup
            $q.Enqueue($Key[1])
            $q.Enqueue($Value)
        }
    }
} |
    # Piping to a hackish loop to limit the row size and emit the rows of text.
    ForEach-Object {
        $row += "$_ "
        if ($row.Length -gt 80 ) {
            $row
            $row = ""
        }
    }
    $row