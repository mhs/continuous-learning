require "spec_helper"

describe "regular expressions" do
  subject(:regex){ /default-this-will-never-match/ }

  describe "character classes" do
    instructions <<-EOT
      Wielding character classes, write a regex 
      that can match each of the following phrases
      by focusing on the first word.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("rubyists r often cool guys") }
    it { should match("rubyisms ftw") }
  end

  describe "the greedy modifier" do
    instructions <<-EOT
      Using a greedy modifier for 0 or more to match everything
      up to the last occurrence of yes in the following phrases.
    EOT

    subject(:regex){ /fill me in/ }

    it do
      md = regex.match("Why yes, I think that -- yes we can! we can? yes? of course, yes!")
      md.post_match.should eq("!")
    end

    context "taming the greedy modifier" do
      instructions <<-EOT
        The greedy matcher for 0 or more characters can be tamed. Write
        a regex (similar to the previous one) that tames the greedy modifier
        to stop after the first occurrence of the word 'yes'.
      EOT

      subject(:regex){ /fill me in/ }

      it do
        md = regex.match("Why yes, I think that -- yes we can! we can? yes? of course, yes!")
        md.post_match.should eq(", I think that -- yes we can! we can? yes? of course, yes!")
      end
    end
  end

  context "one or more times" do
    instructions <<-EOT
      Using the modifier indicating one or more times show that the
      follow strings can be matched (or not) for the term 'anan'.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("bananas")}
    it { should_not match("anaheim")}
    it { should_not match("foo")}    
  end

  describe "anchors" do
    instructions <<-EOT
      Using anchors show that the following phrases
      can be matched by their start and end terms.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("apples to oranges") }
    it { should match("apples are yummier than oranges") }
    it { should match("apples, bananas, and oranges") }

    context "multiline anchors" do
      instructions <<-EOT
        Update the last regex to work on multiline strings
        to pass this example.
      EOT

      it { should match("apples \nto\n oranges") }
    end

    context "start of string / end of string anchors" do
      instructions <<-EOT
        Not using the tradition ^ and $ anchors show that
        the following multiline phrase can be matched to ensure
        that they start with 
      EOT

      subject(:regex){ /fill me in/ }

      it { should match("apples \nto\n oranges") }
      it { should_not match("foo\napples \nto\n oranges\nbar") }
    end

    context "replacing text" do
      instructions <<-EOT
        Note: make sure you understand what <<- is and how it works to see
        how the constructed string behaves in the below example
      EOT

      subject(:regex){ /fill me in/ }

      it "strips all leading white-space up to and including the first non whitespace character" do
        str = <<-EOT
          |This is my
          |multiline crazy
          |string
        EOT
        str.gsub(regex, '').should eq("This is my\nmultiline crazy\nstring\n")
      end
    end

  end

  describe "sub-expressions" do
    instructions <<-EOT
      Using sub-expressions show that the below phrase can be matched
      for any of the below programming languages.
    EOT

    context "use capturing groups" do
      subject(:regex){ /fill me in/ }

      it "captures successfully" do 
        matched = regex =~ "My favorite language is Ruby"
        $1.should == "Ruby"
        matched.should eq(0)
      end

      it { should match("My favorite language is Python") }
      it { should match("My favorite language is JavaScript") }
      it { should match("My favorite language is D") }
    end

    context "use non-capturing groups" do

      subject(:regex){ /fill me in/ }

      it "does't capture" do 
        matched = regex =~ "My favorite language is Ruby"
        $1.should be_nil
        matched.should eq(0)
      end

      it { should match("My favorite language is Python") }
      it { should match("My favorite language is JavaScript") }
      it { should match("My favorite language is D") }
    end
  end

  describe "optional sub-expressions" do
    instructions <<-EOT
      When writing Cucumber step definitions it's common to want to 
      negate a step, ie: "Then I should see X" and "Then I should not see X".
      This can be accomplished in one regular expression opposed to two when 
      making a sub-expression/capturing-group entirely optional.
        
      Writing one regular expression that uses optional sub-expressions
      show that this can be done with the following phrase.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("I should see X") }
    it { should match("I should not see X") }
  end

  describe "sub-expressions and character classes" do
    instructions <<-EOT
      Often times it is useful to capture things within a set of quotes.
      Character classes in combination with capturing groups via 
      sub-expressions can make this possible. Write a regex that shows
      the below phrases matching on the text inside the quotes.
    EOT

    subject(:regex){ /fill me in/ }

    it do
      matched = regex =~ %|I see a "magical unicorn" on the page for "BDD Steve"|
      $1.should eq("magical unicorn")
      $2.should eq("BDD Steve")
      matched.should eq(0)
    end

    it do
      matched = regex =~ %|I see a "powerful princess" on the page for "Landover"|
      $1.should eq("powerful princess")
      $2.should eq("Landover")
      matched.should eq(0)
    end
  end

  context "specific number or range of occurrences" do
    instructions <<-EOT
      Using a specific number of occurences write a regex (similar 
      to one or more occurences previously) to show that the term 'anan' 
      can be matched or not.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("bananas")}
    it { should_not match("anaheim")}
    it { should_not match("foo")}    
  end

  describe "phone numbers" do
    instructions <<-EOT
      Write a regular expression that matches the following phone numbers.
    EOT

    subject(:regex){ /fill me in/ }

    it { should match("616-555-1212")}
    it { should match("555-1212")}
    it { should match("+1-542-223-9789")}
  end

  describe "named capture groups" do
    instructions <<-EOT
      With Ruby 1.9.3p194 or higher you can use named captured groups
      but only in certain situations. Show that the below examples can 
      be fulfilled to pull out the name of the planet
    EOT

    subject(:regex){ /fill me in/ }

    it do
      world = nil

      # For example, we want world to be Xeon, but this won't work based on
      # where the regex is defined.
      regex =~ "The planet Xeon is a wonderful place."
      world.should be_nil

      # So go ahead and inline your regex and watch it work!
      /your regex here/  =~ "The planet Xeon is a wonderful place."
      world.should eq("Xeon")

      /your regex here/  =~ "The planet Earth is an interesting place."
      world.should eq("Earth")
    end
  end

  describe "string scanning" do
    instructions <<-EOT
      Strings have a #scan method which can be used to match a string 
      against a pattern and pull out all of the matches. Using String#scan
      in combination with a regex find all of the HTML tags in use
      in the following example.

      Note: this will likely take a combination of many of the above
      examples.
    EOT

    context "an easier example first" do
      it do
        str = "<html><head></head><body>\n<div>foo</div></body></html>"
        str.scan(regex).should eq( ["<html>", "<head>", "</head>", "<body>", "<div>", "</div>", "</body>", "</html>"])
      end
    end

    context "now a harder one (not including end tags or <, > characters" do
      it do
        str = "<html><head></head><body>\n<div>foo</div></body></html>"
        str.scan(regex).flatten.should eq(["html", "head", "body", "div"])
      end
    end
  end

  describe "gsubbing" do
    describe "String#gsub(regex, str)" do
      instructions <<-EOT
        Using the gsub form that takes a regex and a string in combination with capturing
        sub-expressions show how the below sentences can be re-arranged with one regex.
      EOT

      subject(:regex){ /fill me in/ }

      it do
        str = "The world is a firey place!".gsub(regex, 'string here')
        str.should eq("The firey world is a place!")
      end

      it do
        str = "The planet is a watery place!".gsub(regex, '\1\4\2\3\5')
        str.should eq("The watery planet is a place!")
      end
    end


    describe "String#gsub(regex, &blk)" do
      instructions <<-EOT
        Using the gsub form that takes a regex and a block show how the adjectives
        can be modified.
      EOT

      subject(:regex){ /fill me in/ }

      it do
        str = "The world is a firey place!".gsub(regex){ |m| m.upcase }
        str.should eq("The world is a FIREY place!")
      end

      it do
        str = "The world is a watery place!".gsub(regex){ |m| m.upcase }
        str.should eq("The world is a WATERY place!")
      end
    end

    describe "String#split" do
      instructions <<-EOT
        When splitting on a string in Ruby, if the string being split is the first
        thing being split on it will introduce an empty string into the resulting
        array. This can often mess things up as it's common to join
        the returned results. What method on Ruby can be used to fulfill the failing
        part of the below example?
      EOT

      it do
        "asf".split("a").should eq("", "sf")
        "basf".split("a").should eq("b", "sf")
        "basfa".split("a").should eq("b", "sf", "a")

        arr = "asafad".split("a")
        results = your_code_to_do_something_around(arr)
        results.should eq(["s", "f", "d"])
      end
    end

  end


end