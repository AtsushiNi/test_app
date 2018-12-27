5.times do |i|
  Post.create(title: "タイトル　#{i}", body: "記事ないよう#{i}" * 8)
end
