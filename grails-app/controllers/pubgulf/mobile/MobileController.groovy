package pubgulf.mobile

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import pubgulf.course.Event
import pubgulf.course.EventTeam
import pubgulf.course.HoleScore
import pubgulf.course.ScoreCard
import pubgulf.user.User

class MobileController {

    def userService
    def springSecurityService

    def index() {

        if (springSecurityService.isLoggedIn()) {
            redirect(action: 'events')
        }

        def config = SpringSecurityUtils.securityConfig
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"

        [postUrl: postUrl]
    }

    @Deprecated
    def login() {

        def user = User.findByUsername(params.userName)

        if (!user || user.passwd != springSecurityService.encodePassword(params.password)) {
            response.status = 404
        } else {
            springSecurityService.reauthenticate(user.username, params.password)

        }


    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def events() {

        def events = Event.findAllByIsActive(true)

        if (events.size() == 1) {
            def event = events.get(0)
            //skip if nothing to select
            redirect(action: 'availableTeams',  id:  event.id)
        }

        [events: Event.list()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def course() {

        def event = Event.get(params.id)

        def user = (User) springSecurityService.currentUser

        //get team
        def team = event.teams.find {
            it.player1 == user || it.player2 == user
        }

        //get score cards
        def player1ScoreCard = ScoreCard.findByEventAndUser(event, team?.player1)
        def player2ScoreCard = ScoreCard.findByEventAndUser(event, team?.player2)

        //build if not found
        if (!player1ScoreCard) {
            println 'building 1 .....'
            player1ScoreCard = buildScoreCard(event, team?.player1)
        }

        if (!player2ScoreCard && team?.player2) {
            println 'building 2.....'
            player2ScoreCard = buildScoreCard(event, team?.player2)
        }

        ScoreCard userScoreCard
        ScoreCard partnerScoreCard

        if (player1ScoreCard.user == user) {
            userScoreCard = player1ScoreCard
            partnerScoreCard = player2ScoreCard
        }

        if (player2ScoreCard?.user == user) {
            userScoreCard = player2ScoreCard
            partnerScoreCard = player1ScoreCard
        }

        def teamScoreCard = []

        userScoreCard

        event.holes.sort { it.holeNumber }

        event.holes.each {
            def scoreMap = [:]
            scoreMap.userScore = userScoreCard.holes.find { hole -> hole.holeNumber == it.holeNumber }
            scoreMap.partnerScore = partnerScoreCard?.holes?.find { hole -> hole.holeNumber == it.holeNumber }
            scoreMap.hole = it
            teamScoreCard << scoreMap
        }

        [teamScoreCard: teamScoreCard, userScoreCard: userScoreCard, partnerScoreCard: partnerScoreCard, team: team]
    }

    private ScoreCard buildScoreCard(Event event, User user) {
        def scoreCard = new ScoreCard(event: event, user: user).save(failOnError: true)

        event.holes.each {
            scoreCard.addToHoles(new HoleScore(eventHole: it))
        }

        scoreCard.save(failOnError: true, flush: true)

        scoreCard
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def holeScore() {
        def user = (User) springSecurityService.currentUser

        def holeScore = HoleScore.get(params.id)
        def bunkerString = 'No'
        def waterString = 'No'

        if(holeScore.eventHole.hasBunker) bunkerString = 'Yes'
        if(holeScore.eventHole.hasWaterHazard) waterString = 'Yes'

        [holeScore: holeScore, bunkerString: bunkerString, waterString: waterString, user: user]
    }

    def saveScore() {
        def holeScore = HoleScore.get(params.holeScoreId)

        try {
            holeScore.score = params?.score?.toInteger() ?: 0

            // don't allow neg values
            if (holeScore.score < 0){
                holeScore.score = 0
            }
        } catch (e) {
            holeScore.score = 0
        }
        holeScore.save(failOnError: true)

        redirect(action: 'course', id: holeScore.eventHole.event.id)
    }

    def createAccount() {
        try{
            userService.createUser(params)
            def config = SpringSecurityUtils.securityConfig
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            redirect(controller: '/', action: postUrl,
                    params: ['j_username': params.userName, 'j_password': params.password])
        } catch(Exception e){
            println('in catch..')
            println params.dump()
            println(e.message)
            println(e.dump())
            if(e.undeclaredThrowable.message == 'User Exists'){
                response.status = 409
                def jsonMap = [success: false]
                render jsonMap  as JSON
               // render view: 'index'
            } else {
                println('tossing e')
                println(e.message)
                throw e
            }
        }
        //render [success: false] as JSON
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def availableTeams() {
        def user = (User) springSecurityService.currentUser

        String idString = params.id

        def id = idString.replace('[', '').replace(']', '').toLong()

        def userTeam = EventTeam.findByEventAndPlayer1(Event.get(id), user)

        if (!userTeam) {
            userTeam = EventTeam.findByEventAndPlayer2(Event.get(id), user)
        }

        if (!userTeam) { //user not on team

        } else {
            // user on team for event
            redirect(action: 'course', id: id)
        }

        def teams = EventTeam.findAllByEvent(Event.get(id))

        def availTeams = getAvailTeams(teams)


        return [teams: availTeams, event: Event.get(id)]
    }

    private getAvailTeams(List<EventTeam> teams) {
        def user = springSecurityService.currentUser
        def availTeams = []

        teams.each {
            if (it.player1 == null || it.player2 == null) {
                availTeams << it
            }
        }

        availTeams
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addTeam(){
        return [event: Event.get(params.id)]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def addTeamSave() {

        def user = (User) springSecurityService.currentUser
        def event = Event.get(params.eventId)
        def eventTeam = new EventTeam(teamName: params.teamName, event: event, player1: user).save(failOnError: true)

        redirect(action: 'availableTeams', id: event.id)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def joinTeam(){
        def user = (User) springSecurityService.currentUser
        def team = EventTeam.get(params.id)

        team.player2 = user

        team.save(flush: true, failOnError: true)

        redirect(action: 'course', id: team.event.id)
    }


    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def teams() {
        def event = Event.get(params.id)

        [event: event]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def teamScoreCard() {
        def team = EventTeam.get(params.id)

        if(!team.player1ScoreCard){
            buildScoreCard(team.event, team.player1)
        }

        if(!team.player2ScoreCard){
            buildScoreCard(team.event, team.player2)
        }

        [team: team]
    }
}
