10.times do
  start_date = Date.today + [*2..52].sample.weeks
  end_date = start_date + [*3..21].sample.days

  Trip.create(title: "#{Faker::Address.country} Trip!",
              description: Faker::Lorem.paragraph,
              start_date: start_date,
              end_date: end_date)
end
