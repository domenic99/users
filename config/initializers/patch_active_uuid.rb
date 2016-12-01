ActiveRecord::Base
ActiveRecord::ConnectionAdapters::Table.send :include, ActiveUUID::Patches::Migrations
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, ActiveUUID::Patches::Migrations

if ActiveRecord::VERSION::MAJOR == 4 and ActiveRecord::VERSION::MINOR == 2
  ActiveRecord::ConnectionAdapters::Mysql2Adapter.send :include, ActiveUUID::Patches::AbstractAdapter
else
  ActiveRecord::ConnectionAdapters::Column.send :include, ActiveUUID::Patches::Column
end

ActiveRecord::ConnectionAdapters::Mysql2Adapter.send :include, ActiveUUID::Patches::Quoting
