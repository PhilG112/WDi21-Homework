require "pry"
require "sinatra"
require "sinatra/reloader"
require "sqlite3"

# READ STEP - /bands
# CREATE STEP - /bands/new
# UPDATE STEP - /bands/:id/edit
# DELETE STEP - /bands/:id/delete

get "/" do
  erb(:home)
end

get "/about" do
  erb(:about)
end

get "/bands" do
  db = SQLite3::Database.new("database.db")
  db.results_as_hash = true

  @all_bands = db.execute "SELECT * FROM bands"

  db.close

  erb(:band_index)
end

get "/bands/:id" do
  "This is a bands page"
end
