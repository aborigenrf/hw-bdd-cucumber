Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
   if page.body =~ /#{e1}.*#{e2}/m
    puts "#{e1} is before #{e2}"
  else 
    puts "#{e1} was not before #{e2}"
  end  
  
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