class SwitchDbService

  attr_accessor :type, :description

  def initialize stype, description
    @type = stype
    @description = description
  end

  def process_summary
    # Check the type
    case @type
    when 0
      # Use Project database logic
      handle_project_summary
    else
      # Use primary database logic
      handle_primary_summary
    end
  end

  private

  def handle_project_summary
    # Connect to the Project database

    Summary.establish_connection(:projects)
    #Log database
    Rails.logger.info("Creating a record in database: #{ ActiveRecord::Base.connection_db_config.database }")
    Summary.create(description: @description, stype: 0)

    # Connect back to the default database
    Summary.establish_connection(:primary)
  end

  def handle_primary_summary
    # Connect to the primary database
    Summary.establish_connection(:primary)
    #Log database
    Rails.logger.info("Creating a record in database: #{ ActiveRecord::Base.connection_db_config.database }")
    # Process the summary using primary logic
    Summary.create(description: @description, stype: 1)

    # Connect back to the default database
    # Summary.establish_connection(:primary)
  end
end
