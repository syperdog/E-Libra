class AddMinFreeIdTriggerToBooks < ActiveRecord::Migration[8.0]
  def up
    sql = File.read(Rails.root.join('db/sql/min_free_id_trigger.sql'))
    execute(sql)
  end

  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS set_min_free_id ON books;
      DROP FUNCTION IF EXISTS assign_min_free_id;
    SQL
  end
end
