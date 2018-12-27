5.times do |i|
  Post.create(title: "タイトル　#{i}", body: "記事ないよう#{i}" * 8, email: "example@gmail.com")
end
