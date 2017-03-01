# tournament
A Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament using the Swiss system.

## Files
### - tournament.py 
Contains the methods used to set up the tournament, including adding players, deleting players, running matches, and chekcing the standings.

### - tournament.sql
Contains the SQL table definitions for the tournament project.

## Requirements
This project requires that you have python dowloaded on your computer, and that you run a PostgreSQL database. I used 
[Vagrant](https://www.vagrantup.com) and [VirtualBox] (https://www.virtualbox.org) to set up the database.
Once the database is set up and running you can run the following commands to test and see if it is working:

1. <code>$ psql -f tournament.sql</code>
2. <code>$ python tournament_test.py</code>

You should receive the following output:

1. countPlayers() returns 0 after initial deletePlayers() execution.
2. countPlayers() returns 1 after one player is registered.
3. countPlayers() returns 2 after two players are registered.
4. countPlayers() returns zero after registered players are deleted.
5. Player records successfully deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After match deletion, player standings are properly reset.
9. Matches are properly deleted.
10. After one match, players with one win are properly paired.

Success!  All tests pass!
