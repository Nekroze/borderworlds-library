import greencard


NAMES = []


@greencard.test
def name_unique(card):
    """Check that each card has a unique name."""
    NAMES.append(card.name)
    assert card.name not in NAMES[:-1]
