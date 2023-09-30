setup:
	bundle install
	rails db:drop
	rails db:create
	rails db:schema:load
	rails db:migrate
	rails db:seed
	rails searchkick:reindex:all

server:
	bundle exec rails server -p 3001
