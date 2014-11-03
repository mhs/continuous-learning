var expect = require('expect.js');

describe("Regular Expressions", function() {
	describe("Character Classes", function() {
		it("Write a regex that should match each of the following phrases by focusing on the first word.", function(){
			//var solution = new RegExp("fill me in!");
			var solution = new RegExp("javascripters*");

			expect('javascripters r often cool folks').to.match(solution);
			expect('javascripters ftw').to.match(solution);
			expect('javastinkers lose').to.not.match(solution);
		});
	});

	describe("The Greedy Modifier", function(){
		it("Use a greedy modifier for 0 or more to match everything up to the last occurence of yes in the following phrases", function(){
			//var solution = new RegExp("fill me in!")
			var solution = new RegExp(".*yes");

			var str = "Why yes, I think that -- yes we can! we can? yes? of course, yes!";
			var str2 = "Today, yes is the word of the day! yes it is!";

			var match = str.match(solution);
			var match2 = str2.match(solution);
			// postMatch is the substring of str that occurs after the match.
			var postMatch = str.substring(match[0].length+match.index, str.length);
			var postMatch2 = str2.substring(match2[0].length+match2.index, str.length);

			expect('!').to.equal(postMatch);
			expect(' it is!').to.equal(postMatch2);

		});
	});

	describe("Taming The Greedy Modifier", function(){
		it("The greedy matcher for 0 or more characters can be tamed. Write a regex (similar to the previous one) that tames the greedy modifier to stop after the first occurrence of the word 'yes'.", function(){
			//var solution = new RegExp("fill me in!");
			var solution = new RegExp(".*?yes")

			var str = "Why yes, I think that -- yes we can! we can? yes? of course, yes!";
			var str2 = "Today, yes is the word of the day! yes it is!";

			var match = str.match(solution);
			var match2 = str2.match(solution);
			var postMatch = str.substring(match[0].length+match.index, str.length);
			var postMatch2 = str2.substring(match2[0].length+match2.index, str.length);

			expect(', I think that -- yes we can! we can? yes? of course, yes!').to.equal(postMatch);
			expect(' is the word of the day! yes it is!').to.equal(postMatch2);
		});
	});

	describe("One or More Times", function(){
		it("Using the modifier indicating one or more times, show that the following strings can be matched (or not) for the string \"anan\".", function(){
			//var solution = new RegExp("fill me in!");
			var solution = new RegExp("anan");

			expect('bananas').to.match(solution);
			expect('anaheim').to.not.match(solution);
			expect('foo').to.not.match(solution);
		});
	});

	describe("Anchors", function(){
		it("Using anchors, show that the following phrases can be matched by their start and end terms", function(){
			//var solution = new RegExp("fill me in!");
			var solution = new RegExp("^apples.*oranges$");

			expect('apples to oranges').to.match(solution);
			expect('apples are yummier than oranges').to.match(solution);
			expect('apples, bananas, and oranges').to.match(solution);
			expect('apples and bananas').to.not.match(solution);
			expect('pears, apples, oranges and bananas').to.not.match(solution);

		});
	});

	describe("Multiline Anchors", function(){
		it("Update the last example to work on multiline strings to pass this example.", function(){
			var solution = new RegExp("fill me in!");

			expect('apples \nto\n oranges').to.match(solution);
		});
	});

	describe("Start/End of String Anchors", function(){
		it("Not using the traditional ^ and $ anchors, show that the following multiline phrases can be matched to ensure that they start with apples and end with oranges.", function(){
			var solution = new RegExp("fill me in!");

			expect('apples \nto\n oranges').to.match(solution);
			expect('foo\napples \nto\n oranges\nbar').to.match(solution);

		});
	});

	describe("Replacing Text", function(){
		it("Strip all leading white-space up to and including the first non-whitespace character", function(){
			var solution = new RegExp("fill me in!");

			var str = "   |this is my\n   |crazy multiline\n   |string";
			var processed = str.replace(solution);
			expect('this is my\ncrazy multiline\nstring').to.equal(processed);
		});
	});

	describe("Capturing Groups", function(){
		it("Use a capturing group sub-expression to show that the below phrase can be matched for any of the below programming languages. ", function(){
			var solution = new RegExp("My favorite language is (Javascript|Python|Ruby|D)");
			//var solution = new RegExp("fill me in!");


			var str = "My favorite language is Javascript";
			var processed = str.match(solution);
			expect(processed[1]).to.equal("Javascript");
			expect("My favorite language is Python").to.match(solution);
			expect("My favorite language is Ruby").to.match(solution);
			expect("My favorite language is D").to.match(solution);
		});
	});

	describe("Non-Capturing Groups", function(){
		it("Use a non-capturing group sub-expression to show that the below phrase can be matched for any of the below programming languages. ", function(){
			var solution = new RegExp("My favorite language is (?:Javascript|Python|Ruby|D)");
			//var solution = new RegExp("fill me in!");


			var str = "My favorite language is Javascript";
			var processed = str.match(solution);
			expect(processed[1]).to.be.an('undefined');
			expect("My favorite language is Python").to.match(solution);
			expect("My favorite language is Ruby").to.match(solution);
			expect("My favorite language is D").to.match(solution);
		});
	});

	describe("Optional Sub-Expressions", function(){
		it("When writing Cucumber step definitions it's common to want to negate a step, i.e.: \"Then I should see X\" and \"Then I should not see X\". This can be accomplished in one regular expression when making a sub-expression/capturing group entirely optional. Write one regular expression that uses optional sub-expressions to show that this can be done." , function(){
			var solution = new RegExp("I should (not )?see X");
			//var solution = new RegExp("fill me in!");

			expect("I should see X").to.match(solution);
			expect("I should not see X").to.match(solution);
		});
	});

	describe("Sub-Expressions and Character Classes", function(){
		it("Often it's useful to capture things within a set of quotes. Character classes in combination with capturing groups via sub-expressions can make this possible. Write a regex that shows the below phrases matching on the text inside the quotes." , function(){
			var solution = new RegExp("I see a \"(.*)\" on the page for \"(.*)\"");
			//var solution = new RegExp("fill me in!");

			var str = "I see a \"magical unicorn\" on the page for \"BDD Steve\"";
			var processed = str.match(solution);
			expect(processed[1]).to.equal("magical unicorn");
			expect(processed[2]).to.equal("BDD Steve");
			expect(str).to.match(solution);

			var str2 = "I see a \"powerful princess\" on the page for \"Landover\"";
			var processed = str2.match(solution);
			expect(processed[1]).to.equal("powerful princess");
			expect(processed[2]).to.equal("Landover");
			expect(str2).to.match(solution);
		});
	});

	describe("Specific Number or Range of Occurences", function(){
		it("Using a specific number of occurences, write a regex to show that the term 'an' must be matched twice." , function(){
			var solution = new RegExp(".*(?:an){2}.*");
			//var solution = new RegExp("fill me in!");

			expect("anan").to.match(solution);
			expect("bananas").to.match(solution);
			expect("anaheim").to.not.match(solution);
			expect("nantucket").to.not.match(solution);
			expect("foo").to.not.match(solution);
		});
	});

	describe("Phone Numbers", function(){
		it("Write a regular expression that matches the following phone numbers." , function(){
			var solution = new RegExp("[\+1\-]?([0-9]{3}\-)?[0-9]{3}\-[0-9]{4}");
			//var solution = new RegExp("fill me in!");

			expect("616-555-1212").to.match(solution);
		  expect("555-1212").to.match(solution);
			expect("+1-543-223-2323").to.match(solution);
		});
	});

	// javascript does not have named capturing groups. skipping equivalent exercise
	// that exists in ruby.

	// javascript does not have a built-in string scanner. skipping equivalent exercise
	// that exists in ruby.

	describe("Replacing", function(){
		it("Using replace that takes a regex and a string in combination with capturing sub-expressions show how the below sentences can be re-arranged with one regex." , function(){
			//var solution = new RegExp("(The)( .*)( is a)( .*y)( place)(!)");
			var solution = new RegExp("fill me in!");

			str = "The world is a firey place!".replace(solution, "$1$4$5$3$2$6");
			expect("The firey place is a world!").to.equal(str);

			str2 = "The planet is a watery place!".replace(solution, "string here");
			expect("The watery planet is a place!").to.equal(str);
		});
	});

	describe("Replacing with Caps", function(){
		it("Using replace, show that adjectives can be modified." , 	function(){
			var solution = new RegExp("fill me in!");

			str = "The world is a fiery place!".replace(solution, "string here");
			expect("The world is a FIERY place!").to.equal(str);

			str2 = "The planet is a watery place!".replace(solution, "string here");
			expect("The planet is a WATERY place!").to.equal(str);
		});
	});

	//

	// prototype
	// describe("", function(){
	// 	it("", function(){

	// 	});
	// });


});
