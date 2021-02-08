FactoryBot.define do
  factory :user do
    id { 1 }
    name { "Drew" }
    username{ "dhun90" }
    email {"email@example.com" }
    password {"foobar" }
    password_confirmation { "foobar" }
  end

  factory :entry do
    title { "test entry" }
    body {"test post body" }
    author_id { 1 }
  end
end
