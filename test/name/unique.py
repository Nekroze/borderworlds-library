import greencard


@greencard.library
def name_unique(library):
    """Check that card names are unique."""
    with library.connection() as lcon:
        result = lcon.execute("""SELECT code FROM CARDS WHERE name IN (
        SELECT name FROM CARDS GROUP BY name HAVING (COUNT(name ) > 1)
        )""").fetchall()

        if len(result):
            print("The following have duplicate names.")
            for code in result:
                print("    {0}".format(code[0]))
            assert False
