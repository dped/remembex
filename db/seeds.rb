User.destroy_all
GameSession.destroy_all
FullText.destroy_all
TextParagraph.destroy_all
Game.destroy_all

puts "creating 1 user"

abraham_lincoln = User.new(username: "abraham Lincoln",
  email: "abraham@gmail.com",
  password: "123456",
  avatar: "https://www.doi.gov/sites/doi.gov/files/styles/featured_image__full_width/public/blog-post/primary-images/abraham_lincoln_loc_photo.jpg?itok=FlNGwvbr")

abraham_lincoln.save!

puts "creating 1 full text"

speech = "Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.
But, in a larger sense, we can not dedicate -- we can not consecrate -- we can not hallow -- this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

gettysburg = FullText.new(title: "Gettysburg Address",
  user: abraham_lincoln
)

puts "creating 1 game"

Game.create!(name: "insert_word_game")

gettysburg.generate_paragraphs(speech)
gettysburg.save!

puts "creating 1 full text"

speech = "For the past two weeks you have been reading about a bad break. Yet today I consider myself the luckiest man on the face of the earth.
I have been in ballparks for seventeen years and have never received anything but kindness and encouragement from you fans.
When you look around, wouldn’t you consider it a privilege to associate yourself with such a fine looking men as they’re standing in uniform in this ballpark today?
Sure, I'm lucky. Who wouldn't consider it an honor to have known Jacob Ruppert? Also, the builder of baseball's greatest empire, Ed Barrow?
To have spent six years with that wonderful little fellow, Miller Huggins?
Then to have spent the next nine years with that outstanding leader, that smart student of psychology, the best manager in baseball today, Joe McCarthy?
Sure, I'm lucky. When the New York Giants, a team you would give your right arm to beat, and vice versa, sends you a gift - that's something. When everybody down to the groundskeepers and those boys in white coats remember you with trophies - that's something.
When you have a wonderful mother-in-law who takes sides with you in squabbles with her own daughter - that's something.
When you have a father and a mother who work all their lives so you can have an education and build your body - it's a blessing.
When you have a wife who has been a tower of strength and shown more courage than you dreamed existed - that's the finest I know. So I close in saying that I might have been given a bad break, but I’ve got an awful lot to live for. Thank you."

luckiest_man_alive = FullText.new(title: "Luckiest man alive",
  user: abraham_lincoln
)


luckiest_man_alive.generate_paragraphs(speech)
luckiest_man_alive.save!

puts "creating 1 full text"

speech = "Whose woods these are I think I know.

His house is in the village though;

He will not see me stopping here

To watch his woods fill up with snow.

My little horse must think it queer

To stop without a farmhouse near

Between the woods and frozen lake

The darkest evening of the year.

He gives his harness bells a shake

To ask if there is some mistake.

The only other sound’s the sweep

Of easy wind and downy flake.

The woods are lovely, dark and deep,

But I have promises to keep,

And miles to go before I sleep,

And miles to go before I sleep."



stopping_by_woods_on_a_snowy_evening = FullText.new(title: "Stopping by Woods on a Snowy Evening",
  user: abraham_lincoln
)


stopping_by_woods_on_a_snowy_evening.generate_paragraphs(speech)
stopping_by_woods_on_a_snowy_evening.save!

puts "creating 1 full text"

speech = "“If I were two-faced, would I be wearing this one?”"

two_faced = FullText.new(title: "Two face",
  user: abraham_lincoln
)


two_faced.generate_paragraphs(speech)
two_faced.save!

puts "creating 1 full text"

speech = "Turning once again, and this time more generally, to the question of invasion, I would observe that there has never been a period in all these long centuries of which we boast when an absolute guarantee against invasion, still less against serious raids, could have been given to our people. In the days of Napoleon, of which I was speaking just now, the same wind which would have carried his transports across the Channel might have driven away the blockading fleet. There was always the chance, and it is that chance which has excited and befooled the imaginations of many Continental tyrants. Many are the tales that are told. We are assured that novel methods will be adopted, and when we see the originality of malice, the ingenuity of aggression, which our enemy displays, we may certainly prepare ourselves for every kind of novel stratagem and every kind of brutal and treacherous manœuvre. I think that no idea is so outlandish that it should not be considered and viewed with a searching, but at the same time, I hope, with a steady eye. We must never forget the solid assurances of sea power and those which belong to air power if it can be locally exercised.
I have, myself, full confidence that if all do their duty, if nothing is neglected, and if the best arrangements are made, as they are being made, we shall prove ourselves once more able to defend our island home, to ride out the storm of war, and to outlive the menace of tyranny, if necessary for years, if necessary alone. At any rate, that is what we are going to try to do. That is the resolve of His Majesty's Government – every man of them. That is the will of Parliament and the nation. The British Empire and the French Republic, linked together in their cause and in their need, will defend to the death their native soil, aiding each other like good comrades to the utmost of their strength.
Even though large tracts of Europe and many old and famous States have fallen or may fall into the grip of the Gestapo and all the odious apparatus of Nazi rule, we shall not flag or fail. We shall go on to the end. We shall fight in France, we shall fight on the seas and oceans, we shall fight with growing confidence and growing strength in the air, we shall defend our island, whatever the cost may be. We shall fight on the beaches, we shall fight on the landing grounds, we shall fight in the fields and in the streets, we shall fight in the hills; we shall never surrender, and if, which I do not for a moment believe, this island or a large part of it were subjugated and starving, then our Empire beyond the seas, armed and guarded by the British Fleet, would carry on the struggle, until, in God's good time, the New World, with all its power and might, steps forth to the rescue and the liberation of the old."

we_shall_fight_on_the_beaches = FullText.new(title: "We Shall Fight on the Beaches",
  user: abraham_lincoln
)


we_shall_fight_on_the_beaches.generate_paragraphs(speech)
we_shall_fight_on_the_beaches.save!

puts "creating 1 full text"

speech = "But he said to me, my grace is sufficient for you, for my power is made perfect in weakness.” Therefore I will boast all the more gladly about my weaknesses, so that Christ’s power may rest on me.  That is why, for Christ’s sake, I delight in weaknesses, in insults, in hardships, in persecutions, in difficulties. For when I am weak, then I am strong."

corinthians = FullText.new(title: "Corinthians 12:9-11",
  user: abraham_lincoln
)

corinthians.generate_paragraphs(speech)
corinthians.save!
