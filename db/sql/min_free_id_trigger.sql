CREATE OR REPLACE FUNCTION assign_min_free_id()
      RETURNS TRIGGER AS $$
      DECLARE
        min_free_id INTEGER;
      BEGIN
        SELECT MIN(t1.id + 1) INTO min_free_id
        FROM books t1
        LEFT JOIN books t2 ON t1.id + 1 = t2.id
        WHERE t2.id IS NULL;

        NEW.id = COALESCE(min_free_id, 1); -- Если таблица пуста, начинаем с 1
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER set_min_free_id
      BEFORE INSERT ON books
      FOR EACH ROW
      WHEN (NEW.id IS NULL)
      EXECUTE FUNCTION assign_min_free_id();