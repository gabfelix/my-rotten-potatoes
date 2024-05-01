more_movies = [
  {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
  {:title => 'Star Wars', :rating => 'PG', :release_date => '25/4/1977'},
  {:title => 'Requiem for a dream', :rating => 'R', :release_date => '27/10/2000'},
  {:title => 'Field of dreams', :rating => 'PG', :release_date => '21/04/1989'},
]

more_movies.each do |movie|
  Movie.create!(movie)
end
