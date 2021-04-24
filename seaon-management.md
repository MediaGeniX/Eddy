# New Season
```ruby
default = Season.find_by(default: true)
default.update(default: false)
default.save

s = Season.create(name: "Season 2021", start_date: "2021-03-21", end_date: "2021-09-21", distance_in_meter: 5000000, default: true)
```
