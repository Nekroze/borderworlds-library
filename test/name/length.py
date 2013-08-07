import greencard


@greencard.test
def name_length(card):
    """Ensure that all names are over 3 characters long."""
    assert len(card.name) >= 3
