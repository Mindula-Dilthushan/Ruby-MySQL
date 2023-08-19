# project name    : Ruby-MySQL
# project author  : Mindula Dilthushan
require 'mysql2'
require 'yaml'

class DatabaseConnector
  def initialize(environment = 'development')
    config = load_config(environment)
    puts "Connecting to database..."
    puts "Host: #{config['host']}, Username: #{config['username']}, Database: #{config['database']}"

    @client = Mysql2::Client.new(
      host: config['host'],
      username: config['username'],
      password: config['password'],
      database: config['database']
    )

    if @client.ping
      puts "Connected to the database!"
    else
      puts "Failed to connect to the database."
    end

  end

  def load_config(environment)
    config_path = File.join(__dir__, '..', 'config', 'database.yml')
    config = YAML.load_file(config_path)
    config[environment]
  end

  def execute_query(query)
    @client.query(query)
  end

  def close
    @client.close if @client
  end

end
