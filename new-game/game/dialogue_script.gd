extends RefCounted

class_name DScript

var story = {
	"sample1": 
		
{
	"september_1||v1": {
		"content": [
			"Game Master$$Welcome to Cavite State University Silang Campus!",
			"Game Master$$You’re about to start a whole new chapter of your life.",],
		"choice1": { "choice": "I’m ready to take this seriously.","response": [
			"That’s the spirit! Your hard work will pay off!||gpa_10",],"outcome": "september_2"},
		"choice2": { "choice": "I hope to have fun and make friends.","response": [
			"Building friendships is important too. Good luck!||sociallife_10",],"outcome": "september_2"},
		"choice3": { "choice": "Ugh… school again.","response": [
			"Not the best attitude, but it’s okay.",
			"Let’s see where this goes.||depression_5",],"outcome": "september_2"},
	},
	"september_2||v1": {
		"content": [
			"Game Master$$Every action you take will shape your story.",
			"Game Master$$How will you start your first day?",],
		"choice1": { "choice": "Arrive early and prepared","response": [
			"Great start! You look ready for anything.||gpa_5",],"outcome": "september_3"},
		"choice2": { "choice": "Try to meet new people","response": [
			"Making friends on day one? Impressive!||sociallife_5",],"outcome": "september_3"},
		"choice3": { "choice": "Stay quiet and observe","response": [
			"Nothing wrong with watching first. Stay alert.||depression_-2",],"outcome": "september_3"},
	},
	"september_3||v1": {
		"content": [
			"Guard$$Good day! We’re checking IDs.",],
		"choice1": { "choice": "Thank you for doing your job!","response": [
			"Politeness goes a long way.||sociallife_5",],"outcome": "september_4"},
		"choice2": { "choice": "Just nod quietly","response": [
			"Alright, move along.",],"outcome": "september_4"},
		"choice3": { "choice": "Do we really need this rule?","response": [
			"That's not a great first impression.||sociallife_-5||depression_5",],"outcome": "september_4"},
	},
	"september_4||v1": {
		"content": [
			"Guard$$You’re a freshman, right? We’re giving you a pass for now.",],
		"choice1": { "choice": "Thanks, I’ll remember next time.","response": [
			"Good! We appreciate responsible students.||sociallife_2",],"outcome": "september_5"},
		"choice2": { "choice": "Nice! Free pass!","response": [
			"Don’t get too comfortable.||depression_2",],"outcome": "september_5"},
		"choice3": { "choice": "I still think it’s unnecessary.","response": [
			"You might want to rethink that attitude||sociallife_-5",],"outcome": "september_5"},
	},
	"september_5||v1": {
		"content": [
			"Guard$$Remember, wear your ID daily by October. Understood?",],
		"choice1": { "choice": " Absolutely.","response": [
			"Nice to see some enthusiasm.||sociallife_3",],"outcome": "september_6"},
		"choice2": { "choice": " Nod again silently.","response": [
			"The guard just lets you through.",],"outcome": "september_6"},
		"choice3": { "choice": "Whatever.","response": [
			"That’s not respectful.||sociallife_-5",],"outcome": "september_6"},
	},
	"september_6||v1": {
		"content": [
			"Male_Bully_Normal$$Hey newbie, lost already? Figures.",],
		"choice1": { "choice": "Leave me alone","response": [
			"Whoa, touchy. Good luck surviving here.||depression_5",],"outcome": "september_7"},
		"choice2": { "choice": "Just trying to find my way.","response": [
			"At least you're honest. Try the building across the gym.||sociallife_2",],"outcome": "september_7"},
		"choice3": { "choice": "Haha, maybe a little…","response": [
			"You’re alright. Try not to trip on your way, freshman.||sociallife_5",],"outcome": "september_7"},
	},
	"september_7||v1": {
		"content": [
			"Female_Support_Happy$$Need help? I’ve been here a week already.",
			"Female_Support_Happy$$Want a quick tour?",],
		"choice1": { "choice": "Yes, please! That would help a lot.","response": [
			"Awesome! Let’s start with the library—it’s super chill!||sociallife_10",],"outcome": "september_8"},
		"choice2": { "choice": "Sure, I guess.","response": [
			"Cool. You’ll love the new comlabs.||sociallife_5",],"outcome": "september_8"},
		"choice3": { "choice": "No thanks, I’ll figure it out.","response": [
			"Alright, but don’t be afraid to ask next time.||depression_5",],"outcome": "september_8"},
	},
	"september_8||v1": {
		"content": [
			"Female_Support_Happy$$You have class in Comlab 1, right?",],
		"choice1": { "choice": "Yes! I’m excited!","response": [
			"Yay! That energy will carry you far.||gpa_5||sociallife_2",],"outcome": "october_1"},
		"choice2": { "choice": "I guess so… nervous though.","response": [
			"It’s okay to be nervous. You got this!||gpa_2||depression_-2",],"outcome": "october_1"},
		"choice3": { "choice": "Yeah… let’s just get it over with.","response": [
			"Haha, don’t worry. First days are always weird.||depression_3",],"outcome": "october_1"},
	},
	"october_1||v1": {
		"content": [
			"Male_Support_Happy$$Hey! Want to go to the University Games with me this weekend?",],
		"choice1": { "choice": "Alright! Let’s watch them!","response": [
			"Awesome! It’ll be so fun cheering for our team!||sociallife_10",],"outcome": "october_2"},
		"choice2": { "choice": "Hmm… I’ll think about it.","response": [
			"Cool. Let me know if you change your mind!||sociallife_2",],"outcome": "october_2"},
		"choice3": { "choice": "No, I’ll stay at home.","response": [
			"Alright, maybe next time…||depression_5",],"outcome": "october_2"},
	},
	"october_2||v1": {
		"content": [
			"Sports_Org_Happy$$Hey guys! I’m playing later—come cheer me on, okay?",],
		"choice1": { "choice": "We’ll be there, don’t worry!","response": [
			"You two are the best! Wish me luck!||sociallife_5",],"outcome": "october_3"},
		"choice2": { "choice": "Break a leg! Not literally.","response": [
			"Haha! I’ll do my best!||sociallife_3",],"outcome": "october_3"},
		"choice3": { "choice": "I’m not really into sports…","response": [
			"Oh… well, maybe next time.||sociallife_-3",],"outcome": "october_3"},
	},
	"october_3||v1": {
		"content": [
			"Player (after watching)$$The games were amazing… I kinda want to join next year.",],
		"choice1": { "choice": "Let’s train together soon!","response": [
			"Yesss! Let's work on our stamina!||sociallife_5||gpa_-2",],"outcome": "november_1"},
		"choice2": { "choice": "I’ll think about it seriously.","response": [
			"That’d be great. You’ve got potential!",],"outcome": "november_1"},
		"choice3": { "choice": "Nah, I was just joking.","response": [
			"Aw man, I thought you meant it…||sociallife_-2",],"outcome": "november_1"},
	},
	"november_1||v1": {
		"content": [
			"Female_Support_Happy$$Midterms are next week! Wanna come to a small party this Friday?",],
		"choice1": { "choice": "I’ll pass. I need to study.","response": [
			"You’re so responsible! But don’t burn out.||gpa_10||depression_2",],"outcome": "november_2"},
		"choice2": { "choice": "Maybe, if I finish early.","response": [
			"Fair enough! Hope you balance it well.||gpa_5||sociallife_2",],"outcome": "november_2"},
		"choice3": { "choice": "Heck yes! I need a break.","response": [
			"Woo! Let’s have fun before the stress kicks in!||gpa_-5||sociallife_5",],"outcome": "november_2"},
	},
	"november_2||v1": {
		"content": [
			"Male_Bully_Happy$$Heh, skipping study time? You’ll fail hard.
",],
		"choice1": { "choice": "Back off. I’ll be fine.","response": [
			"Haha, yeah. Don’t cry when grades drop.||gpa_5||depression_3",],"outcome": "november_3"},
		"choice2": { "choice": "Maybe you’re right…","response": [
			"Haha, yeah. Don’t cry when grades drop.||depression_5",],"outcome": "november_3"},
		"choice3": { "choice": "Why do you care?","response": [
			"Wow, touchy much?||sociallife_-2",],"outcome": "november_3"},
	},
	"november_3||v1": {
		"content": [
			"Player$$I’m pulling an all-nighter for this exam…",],
		"choice1": { "choice": "I hope it’s worth it.","response": [
			"It better be. You’ve earned a break after this.||gpa_5",],"outcome": "december_1"},
		"choice2": { "choice": "Should’ve gone to that party.","response": [
			"Regret doesn’t help. Focus now.||depression_5",],"outcome": "december_1"},
		"choice3": { "choice": "Ugh, I’m dying.","response": [
			"Hang in there! One more page…||depression_3",],"outcome": "december_1"},
	},
	"december_1||v1": {
		"content": [
			"Female_Support_Happy$$The Paskuhan Festival’s starting! Let’s roam around and join the activities!",],
		"choice1": { "choice": "Let’s go! I love festivals","response": [
			"Yay! Let’s visit the booths and take photos!||sociallife_10",],"outcome": "december_2"},
		"choice2": { "choice": "I’ll tag along… but I’m tired.","response": [
			"Haha, don’t worry. We’ll take it easy.||sociallife_5||depression_2",],"outcome": "december_2"},
		"choice3": { "choice": "Nah, I’d rather stay home.","response": [
			"Aww, you’ll miss all the fun…||depression_5||sociallife_-3",],"outcome": "december_2"},
	},
	"december_2||v1": {
		"content": [
			"Male_Support_Happy$$Wanna try the parol-making contest or join the raffle?",],
		"choice1": { "choice": "Yes! Let’s do both!","response": [
			"Great choice! Let's make a giant star!||sociallife_5||gpa_-2",],"outcome": "december_3"},
		"choice2": { "choice": "Maybe just one.","response": [
			"Cool, at least you’re doing something!||sociallife_2",],"outcome": "december_3"},
		"choice3": { "choice": "Too lazy for that.","response": [
			"Come on, it's the holidays!||depression_3||sociallife_-2",],"outcome": "december_3"},
	},
	"december_3||v1": {
		"content": [
			"Female_Support_Happy$$The Christmas tree lighting is tonight! Wanna stay ‘til evening?",],
		"choice1": { "choice": "Yes! I wouldn’t miss it.","response": [
			"It’s going to be magical!||sociallife_5",],"outcome": "january_1"},
		"choice2": { "choice": "Maybe for a bit.","response": [
			"At least we’ll see it together, even if just for a while.||sociallife_2",],"outcome": "january_1"},
		"choice3": { "choice": "I’ll skip that one.","response": [
			"Alright… but we’ll miss you.||depression_3||sociallife_2",],"outcome": "january_1"},
	},
	"january_1||v1": {
		"content": [
			"Male_Support_Happy$$Final exams are coming up. We’re having a party to destress—join us?",],
		"choice1": { "choice": "I’ll study instead.","response": [
			"We’ll miss you, but I respect the grind.||gpa_10||depression_5",],"outcome": "january_2"},
		"choice2": { "choice": "Maybe I’ll stop by for a while.","response": [
			"Balance is key, I like it!||gpa_5||sociallife_5",],"outcome": "january_2"},
		"choice3": { "choice": "Sure! Let’s party!","response": [
			"That’s the spirit! Just don’t forget finals!||gpa_-5||sociallife_10",],"outcome": "january_2"},
	},
	"january_2||v1": {
		"content": [
			"Male_Bully_Happy$$Studying again? You’re so boring. Let’s skip and play some games.",],
		"choice1": { "choice": "No thanks. I’m focused.","response": [
			"Tch, whatever. Nerd.||gpa_5",],"outcome": "january_3"},
		"choice2": { "choice": "One round won’t hurt… right?","response": [
			"Haha! See? You’re not that boring.||gpa_-2||sociallife_2",],"outcome": "january_3"},
		"choice3": { "choice": "Sure, games sound better than stress.","response": [
			"That’s more like it! Time to chill.|gpa_-5||depression_-2",],"outcome": "january_3"},
	},
	"january_3||v1": {
		"content": [
			"Female_Support_Happy$$Final review tonight at the gym—group study style. You in?",],
		"choice1": { "choice": "Absolutely. Let’s ace this!","response": [
			"Perfect! You’ll learn a lot with us.||gpa_5||sociallife_2",],"outcome": "february_1"},
		"choice2": { "choice": "I’ll try, if I finish this part.","response": [
			"Okay, just drop by if you can.||gpa_2",],"outcome": "february_1"},
		"choice3": { "choice": "I’ll pass. Studying alone works for me.","response": [
			"Alright, but don’t over-isolate.||gpa_2||sociallife_-2",],"outcome": "february_1"},
	},
	"february_1||v1": {
		"content": [],
	},
	"february_2||v1": {
		"content": [],
	},



# end
}
}
