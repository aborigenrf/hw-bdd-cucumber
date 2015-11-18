Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /"I follow (.*)"/ do |sort_choice|
  if sort_choice == "Movie Title"
    click_on("Release Date")
  elsif sort_choice == "Movie Title" 
    click_on("release_date_header")
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
   (page.body =~ /#{e1}/m) < (page.body =~ /#{e2}/m)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    if uncheck
      uncheck "ratings_#{rating}"
    else
      check "ratings_#{rating}"
    end
  end
end

Then /I should see all the movies/ do
   expect(page.all("table#movies tr").count-1).to eq(10)
end