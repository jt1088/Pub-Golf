import pubgulf.Address
import pubgulf.Pub
import pubgulf.State
import pubgulf.course.Event
import pubgulf.course.EventHole
import pubgulf.course.EventTeam
import pubgulf.user.Role
import pubgulf.user.User
import pubgulf.user.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        if (User.count == 0){
            buildUsers()
        }

        if (State.count() == 0) {
            loadStates()
        }

        if (Pub.count() == 0) {
            loadPubs()
        }

        if (Event.count() == 0) {
            loadEvents()
        }

    }
    def destroy = {
    }

    def buildUsers() {

        // failOnError will throw and exception if this fails validation, default is to die silently, which can suck
        def role_root = Role.findByAuthority('ROLE_ROOT') ?: new Role(authority: 'ROLE_ROOT').save(failOnError: true)
        def role_admin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        // flush tells hibernate flush to the DB - it batches transactions
        def role_user = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true, failOnError: true)

        //application roles
        def roleSystemAdmin = Role.findByAuthority('ROLE_SYSTEM_ADMIN') ?: new Role(authority: 'ROLE_SYSTEM_ADMIN').save(flush: true, failOnError: true)
        def roleReadOnly = Role.findByAuthority('ROLE_READ_ONLY') ?: new Role(authority: 'ROLE_READ_ONLY').save(flush: true, failOnError: true)

        def adminUser = User.findByUsername('admin@gt.com') ?: new User(
                username: 'admin@gt.com', firstName: 'admin', lastName: 'admin_last',
                passwd: 'password',
                enabled: true).save(failOnError: true)


        def thompsonUser = User.findByUsername('john@galenetechnologies.com') ?: new User(
                username: 'john@galenetechnologies.com', firstName: 'John', lastName: 'Thompson',
                passwd: 'password',
                enabled: true).save(failOnError: true)

        def admins = [adminUser, thompsonUser]

        admins.each {
            UserRole.create(it, role_user)
            UserRole.create(it, role_admin)
        }

        // test users
        def user1 = User.findByUsername('Tiger') ?:  new User(
                username: 'tiger', firstName: 'Tiger', lastName: 'Woods',
                passwd: 'password',
                enabled: true).save(failOnError: true)

        def user2 = User.findByUsername('Jack') ?:  new User(
                username: 'jack', firstName: 'Jack', lastName: 'Nicholson',
                passwd: 'password',
                enabled: true).save(failOnError: true)

        def user3 = User.findByUsername('john') ?:  new User(
                username: 'john', firstName: 'John', lastName: 'Daly',
                passwd: 'password',
                enabled: true).save(failOnError: true)

        def user4 = User.findByUsername('phil') ?:  new User(
                username: 'phil', firstName: 'Phil', lastName: 'Mickelson',
                passwd: 'password',
                enabled: true).save(failOnError: true)

        UserRole.create(user1, role_user)
        UserRole.create(user2, role_user)
        UserRole.create(user3, role_user)
        UserRole.create(user4, role_user)
    }

    def loadStates() {

        println "loading state codes"

        new State(stateCode: 'AL', stateName: 'Alabama').save()
        new State(stateCode: 'AK', stateName: 'Alaska').save()
        new State(stateCode: 'AR', stateName: 'Arkansas').save()
        new State(stateCode: 'AZ', stateName: 'Arizona').save()
        new State(stateCode: 'CA', stateName: 'California').save()
        new State(stateCode: 'CO', stateName: 'Colorado').save()
        new State(stateCode: 'CT', stateName: 'Connecticut').save()
        new State(stateCode: 'DC', stateName: 'D.C.').save()
        new State(stateCode: 'DE', stateName: 'Delaware').save()
        new State(stateCode: 'FL', stateName: 'Florida').save()
        new State(stateCode: 'GA', stateName: 'Georgia').save()
        new State(stateCode: 'HI', stateName: 'Hawaii').save()
        new State(stateCode: 'IA', stateName: 'Iowa').save()
        new State(stateCode: 'ID', stateName: 'Idaho').save()
        new State(stateCode: 'IL', stateName: 'Illinois').save()
        new State(stateCode: 'IN', stateName: 'Indiana').save()
        new State(stateCode: 'KS', stateName: 'Kansas').save()
        new State(stateCode: 'KY', stateName: 'Kentucky').save()
        new State(stateCode: 'LA', stateName: 'Louisiana').save()
        new State(stateCode: 'MA', stateName: 'Massachusetts').save()
        new State(stateCode: 'MD', stateName: 'Maryland').save()
        new State(stateCode: 'ME', stateName: 'Maine').save()
        new State(stateCode: 'MI', stateName: 'Michigan').save()
        new State(stateCode: 'MN', stateName: 'Minnesota').save()
        new State(stateCode: 'MO', stateName: 'Missouri').save()
        new State(stateCode: 'MS', stateName: 'Mississippi').save()
        new State(stateCode: 'MT', stateName: 'Montana').save()
        new State(stateCode: 'NC', stateName: 'North Carolina').save()
        new State(stateCode: 'ND', stateName: 'North Dakota').save()
        new State(stateCode: 'NE', stateName: 'Nebraska').save()
        new State(stateCode: 'NH', stateName: 'New Hampshire').save()
        new State(stateCode: 'NJ', stateName: 'New Jersey').save()
        new State(stateCode: 'NM', stateName: 'New Mexico').save()
        new State(stateCode: 'NV', stateName: 'Nevada').save()
        new State(stateCode: 'NY', stateName: 'New York').save()
        new State(stateCode: 'OK', stateName: 'Oklahoma').save()
        new State(stateCode: 'OH', stateName: 'Ohio').save()
        new State(stateCode: 'PA', stateName: 'Pennsylvania').save()
        new State(stateCode: 'RI', stateName: 'Rhode Island').save()
        new State(stateCode: 'SC', stateName: 'South Carolina').save()
        new State(stateCode: 'SD', stateName: 'South Dakota').save()
        new State(stateCode: 'TN', stateName: 'Tennessee').save()
        new State(stateCode: 'TX', stateName: 'Texas').save()
        new State(stateCode: 'UT', stateName: 'Utah').save()
        new State(stateCode: 'VA', stateName: 'Virginia').save()
        new State(stateCode: 'VT', stateName: 'Vermont').save()
        new State(stateCode: 'WA', stateName: 'Washington').save()
        new State(stateCode: 'WI', stateName: 'Wisconsin').save()
        new State(stateCode: 'WV', stateName: 'West Virginia').save()
        new State(stateCode: 'WY', stateName: 'Wyoming').save(flush: true)

        println "states loaded: " + State.count()
    }

    def loadPubs() {

        def address1 = new Address(address1: '111 2nd Ave NE', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Ale & the Witch', address: address1).save(failOnError: true)

        def address2 = new Address(address1: '269 Central Ave', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Crowleys', address: address2).save(failOnError: true)

        def address3 = new Address(address1: '273 Central Ave', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Central Cigar', address: address3).save(failOnError: true)

        def address4 = new Address(address1: '231 Central Ave', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Mandarin Hide', address: address4).save(failOnError: true)

        def address5 = new Address(address1: '18 2nd Street North', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Pelican Pub', address: address5).save(failOnError: true)

        def address6 = new Address(address1: '1 Beach Drive Southeast # 41', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: "Courigan's", address: address6).save(failOnError: true)

        def address7 = new Address(address1: '200 1st Avenue South', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Midtown Sundries', address: address7).save(failOnError: true)

        def address8 = new Address(address1: '330 1st Avenue South', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'The Avenue', address: address8).save(failOnError: true)

        def address9 = new Address(address1: '100 4th Street South', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'World of Beer', address: address9).save(failOnError: true)

        def address10 = new Address(address1: '169 1st Ave N Street', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: '''Mike's Pub''', address: address10).save(failOnError: true)

        def address11 = new Address(address1: '421 4th Ave N', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Tap Room at the Hollander', address: address11).save(failOnError: true)

        def address12 = new Address(address1: '226 1st Ave N', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'The Kitchen', address: address12).save(failOnError: true)

        def address13 = new Address(address1: '2924 5th Ave', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'Crums Bar & Grill', address: address13).save(failOnError: true)

        def address14 = new Address(address1: '2501 Central Ave', city: 'St Petersburg',
                state: State.findByStateCode('FL'), zip: '33701').save(failOnError: true)
        new Pub(name: 'The Queen’s Head', address: address14).save(failOnError: true, flush: true)
    }


    def loadEvents() {

        def event1 = new Event(name: "JT's Test Pub Crawl", eventDate: new Date()).save(failOnError: true)

        def event2 = new Event(name: "Sandra's Short Skirt Golfers Pub Crawl", eventDate: new Date()).save(failOnError: true)

        def event3 = new Event(name: "Test Inactive Event", eventDate: new Date(), isActive: false).save(failOnError: true)


        def pubs = Pub.list()

        Random rand = new Random()

        (0..8).each {
            def bunker = false
            def water = false

            def random = rand.nextInt(2)
            println 'asdfasdfasdf'
            println random

            if (random == 1) bunker = true

            random = rand.nextInt(1)

            if (random == 1) water = true

            new EventHole(event: event1, pub: pubs.get(it), holeNumber: it + 1, par: 3,
                    description: pubs.get(it).name, hasBunker: bunker, hasWaterHazard: water).save(failOnError: true)
            new EventHole(event: event2, pub: pubs.get(it), holeNumber: it + 1, par: 3,
                    description: pubs.get(it).name, hasBunker: bunker, hasWaterHazard: water).save(failOnError: true, flush: true)
            new EventHole(event: event3, pub: pubs.get(it), holeNumber: it + 1, par: 3,
                    description: pubs.get(it).name, hasBunker: bunker, hasWaterHazard: water).save(failOnError: true, flush: true)
        }

        //create teams
        def user1 = User.findByUsername('tiger')
        def user2 = User.findByUsername('jack')
        def user3 = User.findByUsername('john')
        def user4 = User.findByUsername('phil')

        def team1 = event1.addToTeams(new EventTeam(teamName: "Tiger and Jack",
                event: event1, player1: user1, player2: user2)).save(failOnError: true)

        def team2 = event2.addToTeams(new EventTeam(teamName: "Just Jack",
                event: event2, player1: user1)).save(failOnError: true)

        def team3 = event2.addToTeams(new EventTeam(teamName: "Just Tiger",
                event: event2, player1: user2)).save(failOnError: true)

        def team4 = event2.addToTeams(new EventTeam(teamName: "Just John",
                event: event2, player1: user3)).save(failOnError: true)

        def team5 = event2.addToTeams(new EventTeam(teamName: "Just Phil",
                event: event2, player1: user4)).save(failOnError: true, flush: true)

        def team6 = event2.addToTeams(new EventTeam(teamName: "Inactive team",
                event: event3, player1: user4)).save(failOnError: true, flush: true)

    }
}
