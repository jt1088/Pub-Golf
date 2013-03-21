package pubgulf.course


import pubgulf.user.User

class EventTeam {

    Event event
    String teamName
    User player1
    User player2
    Date dateCreated
    Date lastUpdated

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
