require 'active_record'

ActiveRecord::Base.establish_connection({
  adapter: 'sqlite3',
  database: ':memory:'
})

ActiveRecord::Schema.define(:version => 1) do
  create_table 'pastes', force: true do |t|
    t.belongs_to :item, polymorphic: true
    t.timestamps
  end

  create_table 'snippets', force: true do |t|
    t.text 'content', null: false
    t.timestamps
  end

  create_table 'pictures', force: true do |t|
    t.string :url, null: false
    t.timestamps
  end
end

class Paste < ActiveRecord::Base
  belongs_to :item, polymorphic: true
end

class Snippet < ActiveRecord::Base
end

class Picture < ActiveRecord::Base
end
