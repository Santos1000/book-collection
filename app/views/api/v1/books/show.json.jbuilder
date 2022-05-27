json.extract! @book, :id, :name, :category
json.comments @book.comments do |comment|
  json.extract! comment, :id, :review, :stars, :read
end
