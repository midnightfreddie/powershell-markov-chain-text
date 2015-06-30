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
        Select-Object -First 1000 |
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
$MarkovChain = Import-FileToMarkov $FilePath
$MarkovChain