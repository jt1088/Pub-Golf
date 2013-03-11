package pubgulf.course

import pubgulf.AbstractDomainClass
import pubgulf.user.User

class EventTeam extends AbstractDomainClass {

    Event event
    String teamName
    User player1
    User player2

    static constraints = {
        teamName nullable: false
        player1 nullable: false
        player2 nullable: true
    }

    static belongsTo = [event : Event]

    String toString(){
        teamName
    }

    ScoreCard getPlayer1ScoreCard(){
        ScoreCard.findByEventAndUser(event, player1)
    }

    ScoreCard getPlayer2ScoreCard(){
        ScoreCard.findByEventAndUser(event, player2)
    }
}
