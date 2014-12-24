# "Run Command" for Atom

Execute any arbitrary command in [Atom](http://atom.io). Derived from Phil Nash's [Ruby Quick Test](https://github.com/philnash/ruby-quick-test).

# Usage
Smack `ctrl-r` to open up this:

!['Run Command' dialog](https://raw.githubusercontent.com/kylewlacy/run-command/master/screenshots/run-command.gif)

Enter a command, and whack `enter` to run it:

![Running `rake spec`](https://raw.githubusercontent.com/kylewlacy/run-command/master/screenshots/run.gif)

Clack down `cmd-ctrl-r` to run it again:

![Re-running `rake spec`](https://raw.githubusercontent.com/kylewlacy/run-command/master/screenshots/re-run.gif)

Together, these let you do this:

![Bernhardt-style TDD](https://raw.githubusercontent.com/kylewlacy/run-command/master/screenshots/tdd.gif)

(You can also toggle the command output with `cmd-ctrl-x`, or kill the last command with `cmd-ctrl-alt-x`)

# TODO
- ANSI color codes
- Setting the working directory
- Resizable output
- Editor variables (such as `$ATOM_PROJECT` for the current project directory)
