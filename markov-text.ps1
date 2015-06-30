# 2015-06-29 Jim Nelson

# Making a Markov chain text generator based on this article and Python script http://agiliq.com/blog/2009/06/generating-pseudo-random-text-with-markov-chains-u/

$MarkovChain = @{}
$q = New-Object System.Collections.Queue

# Load source text file
Get-Content $env:USERPROFILE\Downloads\my-man-jeeves-project-gutenbertpg8164.txt |
    Select-Object -First 1000 |
    # Since gc is one object per line, do a foreach and split the line, emitting words to pipeline
    ForEach-Object { $_.split() } |
    ForEach-Object {
        $q.Enqueue($_)
        if ($q.Count -eq 3) {
            $Key = @( $q.Dequeue(), $q.Dequeue() )
            $Value = $q.Dequeue()
            $MarkovChain["$Key"] += [string[]]$Value
            $q.Enqueue($Key[1])
            $q.Enqueue($Value)
        }
    }
$MarkovChain