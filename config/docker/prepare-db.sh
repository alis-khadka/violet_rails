# If the database exists, migrate. Otherwise setup (create, migrate and seed)
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate db:seed

echo "Migration Done!"
