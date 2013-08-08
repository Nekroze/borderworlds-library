import greencard


NAMES = set()


@greencard.test
def name_unique(card):
    """Check that each card has a unique name."""
    assert card.name not in NAMES
    NAMES.add(card.name)
