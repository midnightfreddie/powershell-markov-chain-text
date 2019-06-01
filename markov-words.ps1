# 2019-05-31 Jim Nelson

# Adapting the Markov chain idea to make words based on character n-grams

# Increase gradually; my 100,000-name list takes a while to process!
$LimitInput = 1000

# Case-sensitive hash table
$MarkovChain = New-Object System.Collections.Hashtable

# Any list of words will do
# This is from https://www.kaggle.com/kaggle/us-baby-names
# The ForEach-Object loop builds the Markov chain hashtable, using spaces as word starts and ends
Import-Csv "F:\datascience\names\NationalNames.csv" |
    Select-Object -First $LimitInput -ExpandProperty Name |
    ForEach-Object {
        $Word = " " + $PSItem.Trim() + " "
        for ($i = 0; $i -lt $Word.Length - 2; $i++) {
            $MarkovChain[$Word[$i] + $Word[$i+1]] += [char[]]$Word[$i+2]
        }
    }

1..20 | ForEach-Object {
    # Pull all bigram keys starting with whitespace, pick a random one to begin our word/name
    $Word = Get-Random ($MarkovChain.Keys | Where-Object { $PSItem -match '^\s' })

    # Keep adding to word until reaching a space
    while ($Word -notmatch '\s$') {
        # Had troubles with Get-Random and 1-length results, hence the if statement
        $Next = $MarkovChain[$Word[-2] + $Word[-1]]
        if ($Next.Count -gt 1) {
            $Word += Get-Random $Next
        } else {
            $Word += $Next
        }
    }

    $Word.Trim()
}