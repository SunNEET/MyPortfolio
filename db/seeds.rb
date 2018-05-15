3.times do |x|
  Topic.create!(
    title: "Topic #{x}"
  )
end
puts "3 Topics created"

10.times do |x|
  Blog.create!(
    title: "My blog post #{x}",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
    topic_id: Topic.last.id
    )
end
puts "10 blog posts created"

5.times do |x|
  Skill.create!(
    title: "Rails #{x}",
    percent_utilized: 15
  )
end
puts "5 skills created"

8.times do |x|
  Portfolio.create!(
    title: "Portfolio title: #{x}",
    subtitle: "Ruby on Rails",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x250"
  )
end

1.times do |x|
  Portfolio.create!(
    title: "Portfolio title: #{x}",
    subtitle: "Angular",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x250"
  )
end

puts "9 portfolio items created"
