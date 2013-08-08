import greencard


@greencard.library
def name_unique(library):
    """Check that card names are unique."""
    with library.connection() as lcon:
        result = lcon.execute("""SELECT code, name FROM CARDS WHERE name IN (
        SELECT name FROM CARDS GROUP BY name HAVING (COUNT(name ) > 1)
        )""").fetchall()

        if len(result) == 0:
            return None

        dupes = {}
        for code, name in result:
            if name not in dupes:
                dupes[name] = [code]
            else:
                dupes[name].append(code)

        print("\nThe following lists of card codes share the same name.")
        for codes in dupes.values():
            print("    ", codes)
        assert False
