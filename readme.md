# Powershell Markov text

This started as a desire to generate my own Lorem Ipsum text. Googling for tools,
and one link led to another, and eventually I wanted to make my own Powershell
implementation of a Markov chain text generator based on
[Shabda Raaj's article and Python script](http://agiliq.com/blog/2009/06/generating-pseudo-random-text-with-markov-chains-u/).

I saw no need to load the entire text file into memory at once, so it uses pipeline
streams and queues to avoid loading all the text in at once. Of course the Markov
chain variable is in-memory and gets big, but *c'est la vie*.

It's a little rough as-is; I'm commenting and uncommenting parts and hitting F5 in ISE. But it's working and funny right now, so I thought I'd share it now.

Some sample output. The input text is [My Man Jeves](http://www.gutenberg.org/ebooks/8164) by Wodehouse from Project Gutenberg.

> lamb when Jeeves brought me out when the morning milk. That was Freddie all over, 
> I hadn't dragged him in I couldn't manage it. I can recollect."  "Warm?"  "Warmish." 
>  "Or cold?"  "Well, I don't think it is. I believe it's something to follow her like 
> a bloodhound, but nobody came. I was aroused from a blue sky, as it is, but I was 
> once when I was just starting to say you can't tell when you cut it off, and then 
> a soothing voice broke the news to me very much the same stuff. These things are 
> going--what?"  "Sir?"  "Do you think you a good deal of the morning milk. That was 
> what I believe you've got to. Something's got to know him better, he had ever had 
> to tell me that it was pretty sound. He told the story doesn't really start till 
> then.  "In bed! Then he got in and tell Jeeves."  "Very good, sir. Breakfast is ready, 
> sir."  "And Alfred will be impossible for me to understand, sir, that, because you 
> want an instance of what Rocky had been known to press their own way, are very earnest, 
> and expect a full description of all those wild, careless spirits Rocky used to mix 
> with in his eyes. I regarded him with his beastly letter again.  "What you've got 
> a long story. He was pretty rotten of me after dinner that night and get me some 
> money."  "Explain yourself, old top," I said I would have taken Clarence's picture!" 
> He paused. "It might have been             cabarets aren't bad. Don't know when I've 
> felt so happy. I was afraid you might suggest a way of closing in on me. I've simply 
> spent my life scattering largesse to blighters I didn't relish the idea till we found 
> out what had happened. I'd seen it often when we                  *     *   *    
> "Above all, I reflected, a chappie with a look in her voice, a kind of romance, about 
> a month or so I rang the bell and put up the gangway. He looked round the corner 
> to fetch you one. You can't do it! I call it rotten work, springing unexpected offspring 
> on a chair. "A curious lady, Miss Rockmetteller, sir."  "Nothing special."  "You 
> know, you're a life-saver! You've hit on anything to talk business with you last 
> night," she said, getting up to the kid undressed had been in America about a million 
> yelling girls swooped down, with toy balloons. There are limits to the police, when 
> she went on, "I've been cooped up in despair. If only we can do."  She came down 
> in him there was a sort of tosh to put the cup down with the whiskered lunatic it 
> so bally discouraging for a friend of mine--Mr. Wooster."  Lady Malvern and her son 
> Wilmot. A moment I had never met her, but Freddie wouldn't be so bad. As it had dinted 
> the armour, but it hadn't struck me that she was in the soup. I was glad to do it 
> after all, if you fight with his stick.  "Women are frightfully rummy," he said I 
> was feeling most frightfully sorry for the weakness of his chair at this juncture 
> the door flew open and a lot in it. I gave him his head to come here, she stays where 
> she is."  "Rather not! Great pals! Hit it off his trick without a break. I'll be 
> toddling up, then. Toodle-oo, Bertie, old man? It sort of thud.  "Better than I am 
> taking the liberty of wagering him fifty dollars for this seemed to me that a fellow 
> as ever stepped, getting swatted all over the little seat in front, did his best 
> to supply dialogue, we weren't a chatty party.  "Worried! He was notoriously the 
> most wonderful compliment to him. I'll get after him with his mouth nuzzling the 
> stick, blinking at the sound, he stopped, and he disentangled the kid letter-perfect. 
> First rehearsal for lines and business eleven sharp to-morrow."  Poor old Freddie. 
>  "Rather. Curtain of act one on hero, a well-meaning, half-baked sort of bleak about 
> her tone, rather as if she had bright, bulging eyes and a teetotaller and is at a 
> cabaret, the management ought to have taken root."  "I beg your pardon, sir. I have 
> frequently heard him say. And Bicky came trickling in, looking licked to a fellow 
> who has just returned," I heard a cat up a frightful whack on the warpath. So I rang 
> for Jeeves, and I'm nearly crazy."  "Tell me all, old boy," I said.  "An absolute 
> cinch!" said Corky. Not cordially, but he rather thinks he would be one of those 
> bitter, hollow laughs.  "Well, it's bally awkward, you know, he was in bed, quite 
> chirpy, reading Gingery stories.  "What the devil are you going to perdition!"  Poor 
> old Freddie has made an objection.  "But only if I hadn't a friend in the Young Detective's 
> Manual. "You're a great help, Bobbie," I said. The man had the ticket for the first 
> time in our sitting-room, he didn't want him to promise to come back sooner or later, 
> I was about as merry and bright as a kind of cloud on his pet subject, so these little 
> chats used to you on business, and all that, and having long cosy chats about the 
> mouth, which is what you lose on the kid was still able to do is to see me, with 
> a gleaming eye.  "Jeeves seems to me I've bitten my tongue freely on finding him 
> unexpectedly in my midst.  "Did you have any eyelashes. A mild, furtive, sheepish 
> sort of

> intimidated me. She always did have the sense of it? How do you get me back with 
> a poached egg.  It happened after I had set in. I explained the Count, "graciously 
> volunteered his services----"  "I can't bear to be got out the soft music. But the 
> point is that human poached egg that has arisen in connection with the faint green 
> twill."  "It won't take long. The old boy hadn't been expecting her for days. I've 
> got through the atmosphere like the note of a mess."  "You've been swimming with 
> him before you know what to do. I couldn't be expected to be said for having a time!" 
>  "Where is he?"  "In prison!"  "Yes, I found Rocky standing beside me, with a lovely 
> garden, in the window looking out over Piccadilly, and he disentangled the kid and 
> made such a help. Good-bye, Mr. Wooster. He will naturally wish to appear to have 
> been digging into a den of wild beasts and bite a lion on the assemblage.  "Your 
> nephew's man-servant?"  "The man!"  "What are you down for?"  I heard something, 
> too. My room one morning and found him sitting alone in the dining-room and materialized 
> on the foredeck talking to the porter, who sold him. His face with the glass, and 
> stuck it on a walk in life which enabled him to abandon all this nonsense about hens? 
> You led him astray!"  I champed my egg for a hundred up, and began to piece myself 
> together again. I could hear voices. The face disappeared with a rope. He became 
> quite a substantial fortune that Mr. Todd is obliged by the hand and telling a story 
> to the coast, visiting the points of interest on my head, and he didn't say, but 
> apparently she was saying, "that I believe are called mutual expressions of goodwill, 
> the Birdsburg chappie extending a cordial invitation to us quite distinctly. Stealthy 
> footsteps, by George! And then he doesn't know? Even now--Young men, I throw myself 
> on your way up, as you should have known Wilmot better. I should imagine has happened 
> to meet me in----"  "Look out," I cried; "there's someone coming!"  He looked at 
> me in exactly the same impression of omniscience.  As a billiard-table."  "But your 
> recompense, my dear Francis, would consist in the right sort, some who rolled in 
> dollars in houses up by the lads. But, just because he said thoughtfully.  I saw 
> light--a regular flash of speed that you can't think what would happen then. Sooner 
> or later, and is sick, as if he thought it perfectly----"  "I never expected anything 
> like this!"  I remembered that there were no signs of Motty, and I was worth. I woke 
> to hear just how the A.T. had affected Clarence, the Cat's Friend, ready for that 
> sort of St. Andrews in vain as she and I will send Motty back early in the soup. 
> I was sitting at the toffee.  "Kiss Fweddie!" he shouted.  No answer. I opened a 
> copy at random.  "Often of a vanished hand.  "Reggie," he said, irritably. "Don't 
> bark like that. What's the matter?"  "The animal is not too late for you and take 
> a flutter on the teeth of a scrap in progress down below. Want to talk. Presently 
> he came to me very much the same gang, Clarence, my boy. I----"  "Broke off your 
> engagement? How long are you going to happen. You know I'd do you suppose I was so 
> absolutely true, that I sank the pride of the party. A stiff b.-and-s. first of all, 
> and then she said that?"  "I would advocate the blue with the old boy, absolutely. 
> A very vicious specimen. Writes books. She wrote a book about anything. I can't keep 
> it dark. The old boy instead of shaking hands with my brain whirring like a couple 
> of brothers. And when you care enough about me         "My feet are cold," I said. 
> "Lovely night."  "Beautiful," said Stella.  "And as Alfred I should do myself. I 
> want to send for the breadline.  When I can for you, baby," she said.  "Of course 
> he had gone to bed, and it was pretty rotten of me again, he got it--suddenly, when 
> he related with a jerk. There was a sort of thing--Jeeves."  "We can't spend our 
> time acting as his own invention. I must have a look at me, I had done the first 
> time I met Bicky for the fun of the hippodrome. Presently the subject I have generally 
> found his lordship's character went to Boston?"  "Yes. He's remembered it, Mrs. Cardew." 
>  "Oh! is that Jeeves was still with him. He seemed to take the picture, and I was 
> rapidly becoming a dashed amount of satisfaction and pride, that a miracle had come 
> back to the fact that it was the only possible thing to do," I said.  "Why, they 
> change the programme every week there."  "Ah!" I said.  "Yes, sir."  "Oh, Harold!" 
> she cried. "I thought I heard somebody call my name in gold letters. I opened that 
> letter."  "And look at the temples and straggly on top. He wore pince-nez, and he 
> turned and stared at me, then at Jeeves in and out came Stella."  "Great Scot, Jeeves! 
> This is the nature of her like a ton hit me first was precisely the one which he 
> chanced to meet his grace would occupy the second time I had had an uncle who relieved 
> the strain a bit of a great many people, so I had had the appearance of being the 
> infant's father.  "What does he do it, wouldn't you, Jeeves?"  "I endeavour to add 
> the brown suit, sir."  "Well, after all, you wouldn't have imagined them capable 
> of. It sort of