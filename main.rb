# project name    : Ruby-MySQL
# project author  : Mindula Dilthushan

# frozen_string_literal: true
require_relative 'lib/database'

begin
  db_connector = DatabaseConnector.new

  query = "SELECT * FROM dblogin"
  results = db_connector.execute_query(query)

  results.each do |row|
    puts row
  end
rescue Mysql2::Error => e
  puts "An error occurred: #{e.message}"
ensure
  db_connector.close if db_connector
end
