class RemoveSetMinFreeIdTrigger < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      DROP TRIGGER IF EXISTS set_min_free_id ON books;
    SQL
  end

  def down
    execute <<-SQL
      CREATE TRIGGER set_min_free_id
      BEFORE INSERT ON books
      FOR EACH ROW
      EXECUTE FUNCTION assign_min_free_id();
    SQL
  end
end
