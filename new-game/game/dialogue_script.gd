extends RefCounted

class_name DScript

var story = {
	"main": 
		
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
			"Guard$$Politeness goes a long way.%%guard_happy||sociallife_5",],"outcome": "september_4"},
		"choice2": { "choice": "Just nod quietly","response": [
			"Guard$$Alright, move along.",],"outcome": "september_4"},
		"choice3": { "choice": "Do we really need this rule?","response": [
			"Guard$$That's not a great first impression.%%guard_angry||sociallife_-5||depression_5",],"outcome": "september_4"},
	},
	"september_4||v1": {
		"content": [
			"Guard$$You’re a freshman, right? We’re giving you a pass for now.%%guard_normal",],
		"choice1": { "choice": "Thanks, I’ll remember next time.","response": [
			"Good! We appreciate responsible students.%%guard_happy||sociallife_2",],"outcome": "september_5"},
		"choice2": { "choice": "Nice! Free pass!","response": [
			"Don’t get too comfortable.%%guard_angry||depression_2",],"outcome": "september_5"},
		"choice3": { "choice": "I still think it’s unnecessary.","response": [
			"You might want to rethink that attitude%%guard_angry||sociallife_-5",],"outcome": "september_5"},
	},
	"september_5||v1": {
		"content": [
			"Guard$$Remember, wear your ID daily by October. Understood?%%guard_normal",],
		"choice1": { "choice": " Absolutely.","response": [
			"Nice to see some enthusiasm.%%guard_happy||sociallife_3",],"outcome": "september_6"},
		"choice2": { "choice": " Nod again silently.","response": [
			"The guard just lets you through.%%guard_normal",],"outcome": "september_6"},
		"choice3": { "choice": "Whatever.","response": [
			"That’s not respectful.%%guard_angry||sociallife_-5",],"outcome": "september_6"},
	},
	"september_6||v1": {
		"content": [
			"Male Bully$$Hey newbie, lost already? Figures.",],
		"choice1": { "choice": "Leave me alone","response": [
			"Whoa, touchy. Good luck surviving here.%%male-bully_angry||depression_5",],"outcome": "september_7"},
		"choice2": { "choice": "Just trying to find my way.","response": [
			"At least you're honest. Try the building across the gym.||sociallife_2",],"outcome": "september_7"},
		"choice3": { "choice": "Haha, maybe a little…","response": [
			"You’re alright. Try not to trip on your way, freshman.%%male-bully_happy||sociallife_5",],"outcome": "september_7"},
	},
	"september_7||v1": {
		"content": [
			"Female Support$$Need help? I’ve been here a week already.%%female-support_happy",
			"Female Support_Happy$$Want a quick tour?",],
		"choice1": { "choice": "Yes, please! That would help a lot.","response": [
			"Awesome! Let’s start with the library—it’s super chill!%%female-support_happy||sociallife_10",],"outcome": "september_8"},
		"choice2": { "choice": "Sure, I guess.","response": [
			"Cool. You’ll love the new comlabs.%%female-support_happy||sociallife_5",],"outcome": "september_8"},
		"choice3": { "choice": "No thanks, I’ll figure it out.","response": [
			"Alright, but don’t be afraid to ask next time.%%female-support_sad||depression_5",],"outcome": "september_7b"},
	},
	"september_7b||v1": {
		"content": [
			"Player$$I think I lost my way. What should I do?",],
		"choice1": { "choice": "Go back to the girl who offered the tour.","response": [
			"Player$$I hope she's still there.||depression_-3||sociallife_3",],"outcome": "september_8"},
		"choice2": { "choice": "Just roam around.","response": [
			"Player$$All right. I'll find it on my own.||sociallife_-2",],"outcome": "september_8"},
	},
	"september_8||v1": {
		"content": [
			"Female Support$$You have class in Comlab 1, right?",],
		"choice1": { "choice": "Yes! I’m excited!","response": [
			"Female Support$$Yay! That energy will carry you far.%%female-support_happy||gpa_5||sociallife_2",],"outcome": "october_1"},
		"choice2": { "choice": "I guess so… nervous though.","response": [
			"Female Support$$It’s okay to be nervous. You got this!%%female-support_happy||gpa_2||depression_-2",],"outcome": "october_1"},
		"choice3": { "choice": "Yeah… let’s just get it over with.","response": [
			"Female Support$$Haha, don’t worry. First days are always weird.%%female-support_sad||depression_3",],"outcome": "october_1"},
	},
	"october_1||v1": {
		"content": [
			"Male Support$$Hey! Want to go to the University Games with me this weekend?%%male-support_happy",],
		"choice1": { "choice": "Alright! Let’s watch them!","response": [
			"Male Support$$Awesome! It’ll be so fun cheering for our team!%%male-support_happy||sociallife_10",],"outcome": "october_2"},
		"choice2": { "choice": "Hmm… I’ll think about it.","response": [
			"Male Support$$Cool. Let me know if you change your mind!%%male-support_happy||sociallife_2",],"outcome": "october_2"},
		"choice3": { "choice": "No, I’ll stay at home.","response": [
			"Male Support$$Alright, maybe next time…%%male-support_sad||depression_5",],"outcome": "october_2"},
	},
	"october_2||v1": {
		"content": [
			"Sports Org$$Hey guys! I’m playing later—come cheer me on, okay?%%sports-org_happy",],
		"choice1": { "choice": "We’ll be there, don’t worry!","response": [
			"Sports Org$$You two are the best! Wish me luck!%%sports-org_happy||sociallife_5",],"outcome": "october_3"},
		"choice2": { "choice": "Break a leg! Not literally.","response": [
			"Sports Org$$Haha! I’ll do my best!%%sports-org_happy||sociallife_3",],"outcome": "october_3"},
		"choice3": { "choice": "I’m not really into sports…","response": [
			"Sports Org$$Oh… well, maybe next time.%%sports-org_sad||sociallife_-3",],"outcome": "october_3"},
	},
	"october_3||v1": {
		"content": [
			"Player$$The games were amazing… I kinda want to join next year.",],
		"choice1": { "choice": "Let’s train together soon!","response": [
			"Sports Org$$Yesss! Let's work on our stamina!%%sports-org_happy||sociallife_5||gpa_-2",],"outcome": "november_1"},
		"choice2": { "choice": "I’ll think about it seriously.","response": [
			"Sports Org$$That’d be great. You’ve got potential!%%sports-org_normal",],"outcome": "november_1"},
		"choice3": { "choice": "Nah, I was just joking.","response": [
			"Sports Org$$Aw man, I thought you meant it…%%sports-org_sad||sociallife_-2",],"outcome": "november_1"},
	},
	"november_1||v1": {
		"content": [
			"Female Support$$Midterms are next week! Wanna come to a small party this Friday?%%female-support_normal",],
		"choice1": { "choice": "I’ll pass. I need to study.","response": [
			"Female Support$$You’re so responsible! But don’t burn out.%%female-support_happy||gpa_10||depression_2",],"outcome": "november_3"},
		"choice2": { "choice": "Maybe, if I finish early.","response": [
			"Female Support$$Fair enough! Hope you balance it well.%%female-support_normal||gpa_5||sociallife_2",],"outcome": "november_3"},
		"choice3": { "choice": "Heck yes! I need a break.","response": [
			"Female Support$$Woo! Let’s have fun before the stress kicks in!%%female-support_sad||gpa_-5||sociallife_5",],"outcome": "november_1b"},
	},
	"november_1b||v1": {
		"content": [
			"Female Support$$Hey!! You came. Let's have fun tonight!",],
		"choice1": { "choice": "I'm going home soon.","response": [
			"Male Support$$It’s okay. At least you came.||gpa_3",],"outcome": "november_2"},
		"choice2": { "choice": "Party all night!","response": [
			"Male Support$$Yes, of course. Let's get wasted before midterm week!||gpa_-3||sociallife_3",],"outcome": "november_2"},
	},
	"november_2||v1": {
		"content": [
			"Male Bully$$Heh, skipping study time? You’ll fail hard.",],
		"choice1": { "choice": "Back off. I’ll be fine.","response": [
			"Male Bully$$Haha, yeah. Don’t cry when grades drop.%%male-bully_happy||gpa_5||depression_3",],"outcome": "november_3"},
		"choice2": { "choice": "Maybe you’re right…","response": [
			"Male Bully$$Haha, yeah. Don’t cry when grades drop.%%male-bully_happy||depression_5",],"outcome": "november_3"},
		"choice3": { "choice": "Why do you care?","response": [
			"Male Bully$$Wow, touchy much?%%male-bully_angry||sociallife_-2",],"outcome": "november_3"},
	},
	"november_3||v1": {
		"content": [
			"Player$$I’m pulling an all-nighter for this exam…",],
		"choice1": { "choice": "I hope it’s worth it.","response": [
			"Female Support$$It better be. You’ve earned a break after this.%%female-support_happy||gpa_5",],"outcome": "december_1"},
		"choice2": { "choice": "Should’ve gone to that party.","response": [
			"Female Support$$Regret doesn’t help. Focus now.%%female-support_happy||depression_5",],"outcome": "december_1"},
		"choice3": { "choice": "Ugh, I’m dying.","response": [
			"Female Support$$Hang in there! One more page…%%female-support_happy||depression_3",],"outcome": "december_1"},
	},
	"december_1||v1": {
		"content": [
			"Female Support$$The Paskuhan Festival’s starting! Let’s roam around and join the activities!",],
		"choice1": { "choice": "Let’s go! I love festivals","response": [
			"Female Support$$Yay! Let’s visit the booths and take photos!||sociallife_10",],"outcome": "december_2"},
		"choice2": { "choice": "I’ll tag along… but I’m tired.","response": [
			"Female Support$$Haha, don’t worry. We’ll take it easy.||sociallife_5||depression_2",],"outcome": "december_2"},
		"choice3": { "choice": "Nah, I’d rather stay home.","response": [
			"Female Support$$Aww, you’ll miss all the fun…||depression_5||sociallife_-3",],"outcome": "december_1b"},
	},
	"december_1b||v1": {
		"content": [
			"Player$$I'm starting to regret not going to Paskuhan. What should I do?",],
		"choice1": { "choice": "Follow your friend","response": [
			"Player$$All right, I should start preparing.||depression_-2",],"outcome": "december_2"},
		"choice2": { "choice": "Stay home","response": [
			"Player$$All right, I should start preparing.||depression_2",],"outcome": "december_3"},
		"choice3": { "choice": "Sleep","response": [
			"All right, I'll just sleep instead.",],"outcome": "december_3"},
	},
	"december_2||v1": {
		"content": [
			"Male Support$$Wanna try the parol-making contest or join the raffle?",],
		"choice1": { "choice": "Yes! Let’s do both!","response": [
			"Male Support$$Great choice! Let's make a giant star!||sociallife_5||gpa_-2",],"outcome": "december_3"},
		"choice2": { "choice": "Maybe just one.","response": [
			"Male Support$$Cool, at least you’re doing something!||sociallife_2",],"outcome": "december_3"},
		"choice3": { "choice": "Too lazy for that.","response": [
			"Male Support$$Come on, it's the holidays!||depression_3||sociallife_-2",],"outcome": "december_3"},
	},
	"december_3||v1": {
		"content": [
			"Female Support$$The Christmas tree lighting is tonight! Wanna stay ‘til evening?",],
		"choice1": { "choice": "Yes! I wouldn’t miss it.","response": [
			"Female Support$$It’s going to be magical!||sociallife_5",],"outcome": "january_1"},
		"choice2": { "choice": "Maybe for a bit.","response": [
			"Female Support$$At least we’ll see it together, even if just for a while.||sociallife_2",],"outcome": "january_1"},
		"choice3": { "choice": "I’ll skip that one.","response": [
			"Female Support$$Alright… but we’ll miss you.||depression_3||sociallife_2",],"outcome": "january_1"},
	},
	"january_1||v1": {
		"content": [
			"Male Support$$Final exams are coming up. We’re having a party to destress—join us?",],
		"choice1": { "choice": "I’ll study instead.","response": [
			"Male Support$$We’ll miss you, but I respect the grind.||gpa_10||depression_5",],"outcome": "january_2"},
		"choice2": { "choice": "Maybe I’ll stop by for a while.","response": [
			"Male Support$$Balance is key, I like it!%%male-support_happy||gpa_5||sociallife_5",],"outcome": "january_2"},
		"choice3": { "choice": "Sure! Let’s party!","response": [
			"Male Support$$That’s the spirit! Just don’t forget finals!%%male-support_happy||gpa_-5||sociallife_10",],"outcome": "january_1b"},
	},
	"january_1b||v1": {
		"content": [
			"Male Support$$Hey! You made it. Let's have fun!",],
		"choice1": { "choice": "I will go home early.","response": [
			"IMale Support$$ see. You still want to review.%%male-support_angry||gpa_5",],"outcome": "january_2"},
		"choice2": { "choice": "Let's get wasted tonight.","response": [
			"Male Support$$All right! Let's have some fun.%%male-support_happy||gpa_-5||sociallife_5",],"outcome": "january_2"},
		"choice3": { "choice": "I kinda regret this.","response": [
			"Male Support$$You can go home and study if you want.||gpa_2",],"outcome": "january_2"},
	},
	"january_2||v1": {
		"content": [
			"Male Bully$$Studying again? You’re so boring. Let’s skip and play some games.",],
		"choice1": { "choice": "No thanks. I’m focused.","response": [
			"Male Bully$$Tch, whatever. Nerd.||gpa_5",],"outcome": "january_3"},
		"choice2": { "choice": "One round won’t hurt… right?","response": [
			"Male Bully$$Haha! See? You’re not that boring.||gpa_-2||sociallife_2",],"outcome": "january_3"},
		"choice3": { "choice": "Sure, games sound better than stress.","response": [
			"Male Bully$$That’s more like it! Time to chill.|gpa_-5||depression_-2",],"outcome": "january_3"},
	},
	"january_3||v1": {
		"content": [
			"Female Support$$Final review tonight at the gym—group study style. You in?",],
		"choice1": { "choice": "Absolutely. Let’s ace this!","response": [
			"Female Support$$Perfect! You’ll learn a lot with us.||gpa_5||sociallife_2",],"outcome": "february_1"},
		"choice2": { "choice": "I’ll try, if I finish this part.","response": [
			"Female Support$$Okay, just drop by if you can.||gpa_2",],"outcome": "february_1"},
		"choice3": { "choice": "I’ll pass. Studying alone works for me.","response": [
			"Female Support$$Alright, but don’t over-isolate.||gpa_2||sociallife_-2",],"outcome": "february_1"},
	},
	"february_1||v1": {
		"content": [
			"Female Support$$We need to finish our group project. Want to meet up later to work on it?",],
		"choice1": { "choice": "Of course! Let’s finish it early.","response": [
			"Female Support$$Awesome! Let’s finish strong together.||gpa_5||sociallife_3",],"outcome": "february_2"},
		"choice2": { "choice": "Can we do it tomorrow instead?","response": [
			"Female Support$$Okay, but don’t delay too long.||gpa_2||sociallife_-2",],"outcome": "february_2"},
		"choice3": { "choice": "Just send me what to do—I’ll handle it solo.","response": [
			"Female Support$$Alright… but group work means teamwork.||gpa_2||sociallife_-3",],"outcome": "february_2"},
	},
	"february_2||v1": {
		"content": [
			"Male Bully$$You still trying hard? Why don’t you just give up already?",],
		"choice1": { "choice": "Stop bothering me. I’ve had enough.","response": [
			"Male Bully$$Tch. Fine. Whatever.||depression_-5",],"outcome": "february_3"},
		"choice2": { "choice": "I’m ignoring you from now on.","response": [
			"Male Bully$$Pfft. You’re boring anyway.||depression_-2",],"outcome": "february_3"},
		"choice3": { "choice": "Why are you like this?","response": [
			"Male Bully$$...Maybe I’m just angry. Doesn’t matter.||depression_-2",],"outcome": "february_3"},
	},
	"february_3||v1": {
		"content": [
			"Male Support$$We reported the bully to OSAS. They want to hear your side. Will you come?",],
		"choice1": { "choice": "Yes. This needs to stop.","response": [
			"Male Support$$We’re proud of you. That took courage.||depression_-5||sociallife_5",],"outcome": "end_game"},
		"choice2": { "choice": "Maybe… I’m still unsure.","response": [
			"Male Support$$That’s okay. We’ll support you no matter what.||depression_2",],"outcome": "end_game"},
		"choice3": { "choice": "No. I don’t want to get involved.","response": [
			"Male Support$$You don’t deserve this. But we respect your choice.||depression_5||sociallife_-5||sociallife_2",],"outcome": "end_game"},
	},

# end
}
}
