# Contributing

Contributions are welcome, and they are greatly appreciated! Every
little bit helps, and credit will always be given. 

You can contribute in many ways:

## Types of Contributions

### Report Bugs

Report bugs at [Issues][1].

If you are reporting a bug, please include:

* Your library version of git hash.
* Any details about your local setup that might be helpful in troubleshooting.
* Detailed steps to reproduce the bug or better display the problem.


### Submit Feedback

The best way to send a proposal/feedback/suggestion is to file an issue at
[Issues][1].

* Explain in detail how it would work or why it should be changed.
* Keep the scope as narrow as possible, to make it easier to implement.
* Remember that this is a volunteer-driven project, and that contributions
  are welcome :)

## Get Started!

Ready to contribute? Here's how to set up the `borderworlds-library` for local
development allowing you to make your own changes and then publicly submit them
for review and, if accepted, implementation.

1. Fork the `borderworlds-library` repo on GitHub.
2. Clone your fork locally.

        $ git clone git@github.com:your_name_here/borderworlds-library.git
        $ cd borderworlds-library/

3. Create a branch for local development.

        $ git checkout -b name-of-your-bugfix-or-feature

Now you can make your changes locally, for more guidance on this see
[Making Changes](#making-changes).

4. When you're done making changes, check that your changes pass all tests.

        $ make test

5. Commit your changes and push your branch to GitHub.

        $ git add .
        $ git commit -m "Your detailed description of your changes."
        $ git push origin name-of-your-bugfix-or-feature

6. Submit a pull request through the GitHub website.

## Making Changes

Once you have your own fork of the library you should install the tools
required/recommended for manipulating the library.

    $ make tools
    
This will install the [curator][10] tool for editing compiled libraries,
[librator][11] for packing and unpacking card files into a library and [greencard][12]
which will allow you to test the changes you made yourself.


### Card Contributions

Then in order to make/edit/remove a card, just issue:

    $ make change

This will construct the library and start up [curator][10] and then once
[curator][10] is closed all changes will be commit to card files.

### Test Contributions

In order to make a new test, it has to be written in [Python][3] using the
[greencard][12] card testing framework and stored in the `test/attribute`
directory where `attribute` is whatever part of the card you are testing, ie.
name.

For example to test if a card has a name longer then 3 characters the following
would be saved in `test/name/length.py`:

    ```python
    import greencard
    
    
    @greencard.test
    def name_length(card):
        """Ensure length of a cards name is at least 3 characters long."""
        assert len(card.name) >= 3
    ```
        
The docstring is important to include as it makes it much easier to see what
each test does at a glance. The final line, beggining with `assert` is where
the test really happens, the rest just gets it to run, and will make the
assertion that the length (`len`) of a card's name (`card.name`) is greater
then or equal to 3.

### Testing Your Contributions

Once you are completed you can test your changes to see if they work without
error by calling:

    $ make test

The rest is history, no realy it was already explained a little further up in
the steps to [Get Started!](#get-started)

## Pull Request Guidelines

Before you submit a pull request, check that it meets these guidelines:

1. The pull request should pass the `borderworlds-library`
   [Continuous Integration Tests][2]. Check and make sure that the tests pass
   for all cards.

[1]: https://github.com/Nekroze/borderworlds-library/issues
[2]: https://travis-ci.org/Nekroze/borderworlds-library/pull_requests
[10]: https://pypi.python.org/pypi/librarian-curator
[11]: https://pypi.python.org/pypi/librator
[12]: https://pypi.python.org/pypi/greencard
