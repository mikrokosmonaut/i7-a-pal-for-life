"A Pal for Life" by Mikrokosmonaut

Section 1 - Naming

Naming it with is an action applying to one thing and one topic.
Understand "name [something] [text]" or "call [something] [text]" as naming it with.
Unnaming is an action applying to one thing. Understand "unname [something]" as unnaming.

Check naming it with:
	say "Why would you wanna call that something?".

Instead of unnaming:
	try naming the noun with "nothing".

Instead of naming the puppy with "nothing":
	now the alias of the puppy is "";
	now the puppy is improper-named;
	say "You decided that you may have been a little on-the-nose with your initial choice of name and decide to think on it some more.".
	
Instead of naming the puppy with something:
	let N be "[the topic understood]";
	replace the text "'" in N with "";
	now the alias of the puppy is "[N]";
	now the puppy is proper-named;
	say "'[alias of the puppy]' it is!".
	
Section 2 - Custom Commands

A thing can be fetchable. A thing is seldom fetchable.

A posture is a kind of value. standing, sitting and lying are postures. An animal has a posture. The posture of an animal is usually standing.

Rolling over is an action applying to nothing. Understand "roll over" or "role over" as rolling over.
Playing dead is an action applying to nothing. Understand "play dead" or "play ded" as playing dead.
Sitting is an action applying to nothing. Understand "sit" as sitting.
Understand the command "stand" as something new.
Standing is an action applying to nothing. Understand "stand" or "get up" as standing.
Fetching is an action applying to one touchable thing. Understand "fetch [something]" or "fetsh [something]" as fetching.
Understand the command "throw" as something new. Throwing is an action applying to one carried thing. Understand "throw [something]" or "chuck [something]" or "toss [something]" as throwing.
Stroking is an action applying to one thing. Understand "stroke [an animal]" or "pet [an animal]" or "praise [an animal]" or "good boy" as stroking.

Rule for supplying a missing noun while an actor stroking:
	now the noun is the puppy.

Carry out the player rolling over:
	say "You roll on the grass accomplishing nothing other than coating yourself in grass. Not even [the puppy] notices.".
	
Carry out the puppy rolling over:
	now the posture of the puppy is standing;
	now the recent success of the puppy is "rolling".

Report the puppy rolling over:
	say "[The puppy] rolls over on the grass and gets [if the puppy is standing]back [end if]up.".

Carry out the player playing dead:
	say "You essentially just lie down on the grass. You get back up feeling somewhat silly and brush yourself off.".

Before asking the puppy to try playing dead:
	if the posture of the puppy is lying:
		say "[The puppy] is already playing dead." instead.
	
Carry out the puppy playing dead:
	now the posture of the puppy is lying;
	now the recent success of the puppy is "playing".

Report the puppy playing dead:
	say "[The puppy] raises its paw to his head and falls back as if shot.".
	
Carry out the player sitting:
	say "You sit down on the grass and, for a few moments, take stock of the dangers that must lie beyond the fence.".

Before asking the puppy to try sitting:
	if the posture of the puppy is sitting:
		say "[The puppy] is already sitting, cross-legged as it happens." instead.
	
Carry out the puppy sitting:
	now the posture of the puppy is sitting;
	now the recent success of the puppy is "sitting".
	
Report the puppy sitting:
	say "[The puppy] sits down, his hind legs forming a kind of half-canine half-lotus pose.".
	
Carry out the player standing:
	say "There you stand. There you stand, indeed.".

Before asking the puppy to try standing:
	if the posture of the puppy is standing:
		say "[The puppy] is already standing." instead.
	
Carry out the puppy standing:
	now the posture of the puppy is standing;
	now the recent success of the puppy is "standing".
	
Report the puppy standing:
	say "[The puppy] jumps to attention.".
	
Carry out the player fetching:
	say "(people 'take' or 'get' things, they don't 'fetch' them)";
	try taking the noun instead.
	
Before asking the puppy to try fetching:
	let L be the location of the puppy;
	if the noun is not contained by L:
		say "[The puppy] can't see [the noun]." instead.
		
Carry out the puppy fetching:
	now the puppy is standing;
	now the noun is carried by the player;
	now the recent success of the puppy is "fetching".

Report the puppy fetching:
	say "[The puppy] [one of]runs over to[or]pounces on[or]chases down[at random] [the noun], picks [regarding the noun][them] up and brings it back to you with a light coating of saliva.".
	
Check throwing something that is not fetchable:
	say "[The puppy] won't be able to fetch that." instead.
			
Carry out throwing something fetchable:
	move the noun to the location of the player.

Report throwing something fetchable:
	say "You [one of]throw[or]chuck[or]toss[purely at random] [the noun].";
	try asking the puppy to try fetching the noun.

Check stroking something that is not the puppy:
	say "U can't touch this! (MC Hammer, 1990)" instead.

Carry out stroking:
	if the recent success of the puppy is not "":
		let current level be the level corresponding to a request of recent success of the puppy in the Table of Puppy Behaviour;
		if current level is greater than 1:
			decrement current level;
			if current level is 1, increment the score;
			now the level corresponding to a request of recent success of the puppy in the Table of Puppy Behaviour is current level;
			now the posture of the puppy is sitting;
		now the recent success of the puppy is "".
		
Report stroking:
	say "[The puppy] sits up as you stroke him behind the ears and say 'Good boy, good boy!' to let him know he's earned your praise.".
		
Section 3 - Puppy Behaviour

Use scoring. The maximum score is 5.

Table of Puppy Behaviour
request	level
"sitting"	4
"standing"	4
"rolling"	5
"playing"	5
"fetching"	6

A persuasion rule for asking the puppy to try doing something when the alias of the puppy is "":
	say "[The puppy] needs a name before you can start teaching it tricks.";
	persuasion fails.
	
A persuasion rule for asking the puppy to try doing something:
	let action text be "[current action]";
	replace the text "[alias of the puppy]" in action text with "the puppy";
	now action text is word number 6 in action text;
	if the action text is a request listed in the Table of Puppy Behaviour:
		let current level be the level corresponding to a request of action text in the Table of Puppy Behaviour;
		if a random chance of 1 in current level succeeds:
			if current level is greater than 1:
				decrement current level;
				if current level is 1, increment the score;
				now the level corresponding to a request of action text in the Table of Puppy Behaviour is current level;
			persuasion succeeds;
	say "[The puppy] [one of]ignores you[or]looks confused[or]seems distracted[or]doesn't seem to be interested[at random].";
	now the recent success of the puppy is "";
	persuasion fails.

Every turn when the recent success of the puppy is "":
	let acted be false;
	if a random chance of 1 in 10 succeeds:
		say "[The puppy] [one of]tries to catch your shadow[or]tries to catch his own shadow[or]runs after a bird[at random].[run paragraph on]";
		now the puppy is standing;
		now acted is true;
	if a random chance of 1 in 10 succeeds:
		say "[If acted is true] After that, he[otherwise][The puppy][end if] [one of]gives you an adorable look[or]starts chewing at your left shoe[or]starts chewing at your right shoe[at random].";
		now the puppy is sitting;
		now acted is false;
	if acted is true:
		say "[paragraph break]".

Section 4 - Out of world Actions

Report requesting the score:
	let skillset be a list of text;
	repeat through the Table of Puppy Behaviour:
		if the level entry is 1:
			if request entry is "playing":
				add "playing dead" to skillset;
			otherwise if request entry is "rolling":
				add "rolling over" to skillset;
			otherwise:
				add request entry to skillset;
	say "So far, [the puppy] is capable of [if number of entries in skillset is 2]both [end if][if skillset is empty]very little[otherwise][skillset][end if].".
	
Section 5 - Content
	
[The locations and items]
The Back Garden is a room. The description of it is "A beautiful summer day in your jungle hideout with your new animal companion! What could be better? A wooden fence surrounds you, casting shadows of imaginary trees all around. When you're ready, your destiny awaits you to the north through the patio door.".

The patio door is a closed openable door. It is north of the Back Garden and south of the Living Room. The description of it is "Through the glass, you can just about make out the bear sleeping on the living room couch to the muted sound of daytime TV. 'What[']s a bear doing in the jungle?' you wonder.".
		
A chew toy is in the garden. The chew toy is fetchable. The description of it is "It's basically just a short length of rope with knots tied at both ends.". Understand "rope" or "knot" or "not" or "toi" or "choo" as the chew toy.

The scribbled note is a thing. The description of it is "Triks[paragraph break]1. play ded[line break]2. role over[line break]3. fetsh[paragraph break]Note: remember to pet him a lot.".

The lidless pen is a fetchable thing. The description of it is "An old BIC pen without the lid.".

Grass is scenery in the garden. The description of it is "The freshly-cut grass gives off a smell that will one day come to define your childhood.". Understand "lawn" or "lorn" or "gras" as the grass.

The sun is scenery in the garden. The description of it is "You're pretty sure your mother said something about not doing specifically that.".

The fence is scenery in the garden. The description of it is "A high-rising wooden fence separating [if the alias of the puppy is not empty][alias of the puppy]onia[otherwise]you and your new pal[end if] from the surrounding jungle.". Understand "fense" or "fens" or "trees" or "treez" or "jungle" or "jungel" as the fence.

[The puppy]
The puppy is an animal in the Back Garden. The puppy has some texts called alias and recent success. The alias of the puppy is "". The recent success of the puppy is "". The description of the puppy is "[The puppy] is [posture of the puppy] on the grass[if the puppy is lying], playing dead[end if].". Understand the alias property as describing the puppy. Understand "dog" or "puppi" or "pupi" or "pupy" as the puppy.
	
After printing room description details of the puppy when the alias of the puppy is not "":
	say "[if the puppy is sitting] sitting on the grass[otherwise if the puppy is lying] playing dead[end if]".
	
Rule for printing the name of the puppy when the alias of the puppy is not "":
	say "[alias]".
	
Section 6 - The Plot

When play begins:
	now right hand status line is "Score: [score]/[maximum score]";
	say "[bold type]The last couple of hours have been the best ever. You've never had so much fun! Unfortunately, if you want to keep your new playmate around for more than a day, you're going to have to teach him a few tricks to impress your parents enough to let you keep it.[paragraph break]After drafting up a list of tricks you want to try teaching the puppy, you stuff the paper into your pocket and get down to business.[roman type][line break]";
	now the player carries the scribbled note;
	now the player carries the pen.

Instead of opening the patio door:
	now the patio door is open;
	try going north instead.

Before going to the living room:
	if the score is less than the maximum score:
		say "Are you sure you're ready to show your parents?";
		unless player consents:
			now the patio door is closed;
			do nothing instead.
	
After going to the living room:
	say "You walk in at the same time your mother arrives back from the shop, waking your father in the process. Rather than give your parents a chance to think it through, you cut straight to the show.[paragraph break]";
	if score is 0:
		say "Not only do you not manage to impress them, but your parents also have a good giggle at yours (and [the puppy]'s) expense.";
	otherwise if score is less than 3:
		say "Your parents are impressed you managed to teach [the puppy] anything at all. As the saying goes[if the score is 1] (I think)[end if],'[score in words] out of [maximum score in words] ain't bad!'";
	otherwise if score is less than 5:
		say "You show your new pal-for-life's skill-set, wowing your parents in the process!";
	otherwise:
		say "Your parents are outright amazed with what you've managed to teach [the puppy], 'and you only found him a couple of hours ago, you said?' they exclaim, 'How about that?'.";
	end the story finally saying "[bold type][if the score is 0]The good news is that[otherwise]In the end, [end if]your parents decide that [the puppy] has been a good influence on you. 'We[']ve never seen you so happy' they tell you. It looks like your adventures with [the puppy] are just beginning![roman type]".