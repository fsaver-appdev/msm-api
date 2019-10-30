require "rails_helper"

describe "/movies/last_decade" do
  it "has a list of all movies from the last decade", :points => 0 do

    carol = Movie.new
    carol.title = "Carol"
    carol.description = "An aspiring photographer develops an intimate relationship with an older woman in 1950s New York."
    carol.duration = 108
    carol.year = 2015
    carol.save

    spirited_away = Movie.new
    spirited_away.title = "Spirited Away"
    spirited_away.description = "You'd be surprised how much trauma is caused by a Dad not asking for directions."
    spirited_away.duration = 108
    spirited_away.year = 2001
    spirited_away.save

    get_out = Movie.new
    get_out.title = "Get Out"
    get_out.description = "These white people be crazy."
    get_out.duration = 130
    get_out.year = 2017
    get_out.save

    visit "/movies/last_decade"

    expect(page).to have_content(Movie.last_decade.to_json)

  end
end

describe "/movies/short" do
  it "has the list of all movies that are <= 90 minutes", :points => 0 do
    carol = Movie.new
    carol.title = "Carol"
    carol.description = "An aspiring photographer develops an intimate relationship with an older woman in 1950s New York."
    carol.duration = 108
    carol.year = 2015
    carol.save

    fantastic_mr_fox = Movie.new
    fantastic_mr_fox.title = "Fantastic Mr. Fox"
    fantastic_mr_fox.description = "An urbane fox cannot resist returning to his farm raiding ways and then must help his community survive the farmers' retaliation."
    fantastic_mr_fox.duration = 87
    fantastic_mr_fox.year = 2009
    fantastic_mr_fox.save

    space_jam = Movie.new
    space_jam.title = "Space Jam"
    space_jam.description = "People always forget that Bill Murray's in this movie."
    space_jam.duration = 88
    space_jam.year = 1996
    space_jam.save

    visit "/movies/short"

    expect(page).to have_content(Movie.short.to_json)

  end
end

describe "/movies/long" do
  it "has the list of all movies that are >= 180 minutes", :points => 0 do
    gone_with_the_wind = Movie.new
    gone_with_the_wind.title = "Gone with the Wind"
    gone_with_the_wind.description = "An aspiring photographer develops an intimate relationship with an older woman in 1950s New York."
    gone_with_the_wind.duration = 238
    gone_with_the_wind.year = 1939
    gone_with_the_wind.save

    avengers_endgame = Movie.new
    avengers_endgame.title = "Avengers: Endgame"
    avengers_endgame.description = "Mostly US propaganda and inconsistent storytelling."
    avengers_endgame.duration = 181
    avengers_endgame.year = 2017
    avengers_endgame.save

    space_jam = Movie.new
    space_jam.title = "Space Jam"
    space_jam.description = "People always forget that Bill Murray's in this movie."
    space_jam.duration = 88
    space_jam.year = 1996
    space_jam.save

    visit "/movies/long"

    expect(page).to have_content(Movie.long.to_json)

  end
end

describe "/movies/[ID OF A MOVIE]/director" do
  it "shows the director of one movie", :points => 0 do

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.save

    get_out = Movie.new
    get_out.title = "Get Out"
    get_out.description = "These white people be crazy."
    get_out.director_id = jordan_peele.id
    get_out.year = 2017
    get_out.save

    visit "/movies/#{get_out.id}/director"

    expect(page).to have_content(get_out.director.to_json)

  end
end

describe "/movies/[ID OF A MOVIE]/characters" do
  it "shows the characters in one specific movie", :points => 0 do
    space_jam = Movie.new
    space_jam.title = "Space Jam"
    space_jam.description = "People always forget that Bill Murray's in this movie."
    space_jam.duration = 88
    space_jam.year = 1996
    space_jam.save

    michael_jordan = Character.new
    michael_jordan.movie_id = space_jam.id
    michael_jordan.name = "Michael Jordan"
    michael_jordan.save

    bill_murray = Character.new
    bill_murray.movie_id = space_jam.id
    bill_murray.name = "Bill Murray"
    bill_murray.save

    visit "/movies/#{space_jam.id}/characters"

    expect(page).to have_content(space_jam.characters.to_json)

  end
end

describe "/movies/[ID OF A MOVIE]/cast" do
  it "shows the cast of one specific movie", :points => 0 do

    space_jam = Movie.new
    space_jam.title = "Space Jam"
    space_jam.description = "People always forget that Bill Murray's in this movie."
    space_jam.duration = 88
    space_jam.year = 1996
    space_jam.save

    actor_michael_jordan = Actor.new
    actor_michael_jordan.name = "Michael Jordan"
    actor_michael_jordan.save

    michael_jordan = Character.new
    michael_jordan.movie_id = space_jam.id
    michael_jordan.actor_id = actor_michael_jordan.id
    michael_jordan.name = "Michael Jordan"
    michael_jordan.save

    actor_bill_murray = Actor.new
    actor_bill_murray.name = "Bill Murray"
    actor_bill_murray.save

    bill_murray = Character.new
    bill_murray.movie_id = space_jam.id
    bill_murray.actor_id = actor_bill_murray.id
    bill_murray.name = "Bill Murray"
    bill_murray.save

    visit "/movies/#{space_jam.id}/characters"

    expect(page).to have_content(space_jam.characters.to_json)

  end
end

describe "/directors/youngest" do
  it "shows the youngest director", :points => 0 do
    christopher_nolan = Director.new
    christopher_nolan.name = "Christopher Nolan"
    christopher_nolan.save

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.save

    visit "/directors/youngest"

    expect(page).to have_content(Director.youngest.to_json)
  end
end

describe "/directors/eldest" do
  it "shows oldest director", :points => 0 do
    christopher_nolan = Director.new
    christopher_nolan.name = "Christopher Nolan"
    christopher_nolan.dob = 27.years.ago
    christopher_nolan.save

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.dob = 32.years.ago
    jordan_peele.save

    visit "/directors/eldest"

    expect(page).to have_content(Director.eldest.to_json)
  end
end

describe "/directors/[ID OF A DIRECTOR]/filmography" do
  it "shows all the movies that one director directed", :points => 0 do

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.save

    get_out = Movie.new
    get_out.title = "Get Out"
    get_out.description = "These white people be crazy."
    get_out.director_id = jordan_peele.id
    get_out.year = 2017
    get_out.save

    us = Movie.new
    us.title = "US"
    us.description = "It's nice to hold hands."
    us.director_id = jordan_peele.id
    us.year = 2019
    us.save

    visit "/directors/#{jordan_peele.id}/filmography"

    expect(page).to have_content(jordan_peele.filmography.to_json)

  end
end

describe "/actors/[ID OF AN ACTOR]/characters" do
  it "shows all the characters that an Actor has played", :points => 0 do
    aubrey_plaza = Actor.new
    aubrey_plaza.name = "Aubrey Plaza"
    aubrey_plaza.save

    ingrid_thornbun = Character.new
    ingrid_thornbun.name = "Ingrid Thorburn"
    ingrid_thornbun.actor_id = aubrey_plaza.id
    ingrid_thornbun.save

    karen = Character.new
    karen.name = "Karen Barclay"
    karen.actor_id = aubrey_plaza.id
    karen.save

    visit "/actors/#{aubrey_plaza.id}/characters"

    expect(page).to have_content(aubrey_plaza.characters.to_json)

  end
end

describe "/actors/[ID OF AN ACTOR]/filmography" do
  it "shows all the movies an Actor has been in", :points => 0 do
    saoirse_ronan = Actor.new
    saoirse_ronan.name = "Saoirse Ronan"
    saoirse_ronan.save

    lady_bird = Movie.new
    lady_bird.title = "Lady Bird"
    lady_bird.save

    lady_bird_mc = Character.new
    lady_bird_mc.name = "Lady Bird McPherson"
    lady_bird_mc.actor_id = saoirse_ronan.id
    lady_bird_mc.movie_id = lady_bird.id
    lady_bird_mc.save

    atonement = Movie.new
    atonement.title = "Atonement"
    atonement.save

    briony_talis = Character.new
    briony_talis.name = "Briony Tallis"
    briony_talis.actor_id = saoirse_ronan
    briony_talis.movie_id = atonement.id
    briony_talis.save

    visit "/actors/#{saoirse_ronan.id}/filmography"

    expect(page).to have_content(saoirse_ronan.filmography.to_json)
  end
end

describe "/delete_movie/[ID OF A MOVIE]" do
  it "shows the movie record that has been deleted", :points => 0 do

    lady_bird = Movie.new
    lady_bird.title = "Lady Bird"
    lady_bird.save

    movie_count = Movie.all.count

    visit "/delete_movie/#{lady_bird.id}"

    expect(page).to have_content(lady_bird.to_json)
    expect(Movie.all.count).to eql(movie_count - 1)
  end
end

describe "/delete_director/[ID OF A DIRECTOR]" do
  it "shows the director record that has been deleted", :points => 0 do

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.save

    director_count = Director.all.count

    visit "/delete_director/#{jordan_peele.id}"

    expect(page).to have_content(jordan_peele.to_json)
    expect(Director.all.count).to eql(director_count - 1)
  end
end

describe "/delete_actor/[ID OF A ACTOR]" do
  it "shows the actor record that has been deleted", :points => 0 do

    saoirse_ronan = Actor.new
    saoirse_ronan.name = "Saoirse Ronan"
    saoirse_ronan.save

    actor_count = Actor.all.count

    visit "/delete_actor/#{saoirse_ronan.id}"

    expect(page).to have_content(saoirse_ronan.to_json)
    expect(Actor.all.count).to eql(actor_count - 1)
  end
end

describe "/delete_character/[ID OF A CHARACTER]" do
  it "shows the character record that has been deleted", :points => 0 do

    ingrid_thornbun = Character.new
    ingrid_thornbun.name = "Ingrid Thorburn"
    ingrid_thornbun.save

    character_count = Character.all.count

    visit "/delete_character/#{ingrid_thornbun.id}"

    expect(page).to have_content(ingrid_thornbun.to_json)
    expect(Character.all.count).to eql(character_count - 1)
  end
end

describe "/insert_director_record" do
  it "creates a new director record", :points => 0 do

    d_count = Director.all.count

    visit "/insert_director_record?input_name=Josh Cooley"

    d = Director.where( {:name => "Josh Cooley"}).at(0)

    expect(page).to have_content(d.to_json)
    expect(Director.all.count).to eql(d_count + 1)
  end
end

describe "/insert_movie_record" do
  it "creates a new movie record", :points => 0 do

    d_count = Movie.all.count

    visit '/insert_movie_record?input_title=Toy Story 4&input_year=2019&director_id=35&input_duration=100&input_description=When a new toy called "Forky" joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be for a toy.'

    d = Movie.where({:title => "Toy Story 4"}).first

    expect(page).to have_content(d.to_json)
    expect(Movie.all.count).to eql(d_count + 1)
  end
end

describe "/insert_actor_record" do
  it "creates a new actor record", :points => 0 do

    d_count = Actor.all.count

    visit "/insert_actor_record?input_name=Annie Potts"

    d = Actor.where({ :name => "Annie Potts"}).first

    expect(page).to have_content(d.to_json)
    expect(Actor.all.count).to eql(d_count + 1)
  end
end

describe "/insert_character_record" do
  it "creates a new character record", :points => 0 do

    d_count = Character.all.count

    visit "/insert_character_record??name=Bo Peep&actor_id=653&movie_id=51"

    d = Character.where({ :name => "Bo Peep"}).first

    expect(page).to have_content(d.to_json)
    expect(Character.all.count).to eql(d_count + 1)
  end
end

describe "/update_movie/[ANY EXISTING ID NUMBER]" do
  it "creates a new movie record", :points => 0 do

    lady_bird = Movie.new
    lady_bird.title = "Lady Bird"
    lady_bird.image = "http://www.old.url"
    lady_bird.save

    visit "/update_movie/#{lady_bird.id}?input_image_url=http://some.updated.url"

    d = Movie.where({ :title => "Lady Bird"}).first

    expect(d.image).to eql("http://some.updated.url")
  end
end

describe "/update_actor/[ANY EXISTING ID NUMBER]" do
  it "creates a new actor record", :points => 0 do

    saoirse_ronan = Actor.new
    saoirse_ronan.name = "Saoirse Ronan"
    saoirse_ronan.save

    visit "/update_actor/#{saoirse_ronan.id}?input_name=Fixed Name&input_bio=A Longer Bio"

    d = Actor.where({:id => saoirse_ronan.id }).first
    expect(d.name).to eql("Fixed Name")
    expect(d.bio).to eql("A Longer Bio")
  end
end

describe "/update_director/[ANY EXISTING ID NUMBER]" do
  it "creates a new director record", :points => 0 do

    jordan_peele = Director.new
    jordan_peele.name = "Jordan Peele"
    jordan_peele.save

    visit "/update_director/#{jordan_peele.id}?input_name=Changed Name&input_bio=A Better Bio"

    d = Director.where({:id => jordan_peele.id }).first
    expect(d.name).to eql("Changed Name")
    expect(d.bio).to eql("A Better Bio")
  end
end




