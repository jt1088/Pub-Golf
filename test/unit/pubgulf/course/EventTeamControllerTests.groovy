package pubgulf.course

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(EventTeamController)
@Mock(EventTeam)
class EventTeamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eventTeam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventTeamInstanceList.size() == 0
        assert model.eventTeamInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eventTeamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventTeamInstance != null
        assert view == '/eventTeam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eventTeam/show/1'
        assert controller.flash.message != null
        assert EventTeam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eventTeam/list'

        populateValidParams(params)
        def eventTeam = new EventTeam(params)

        assert eventTeam.save() != null

        params.id = eventTeam.id

        def model = controller.show()

        assert model.eventTeamInstance == eventTeam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eventTeam/list'

        populateValidParams(params)
        def eventTeam = new EventTeam(params)

        assert eventTeam.save() != null

        params.id = eventTeam.id

        def model = controller.edit()

        assert model.eventTeamInstance == eventTeam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eventTeam/list'

        response.reset()

        populateValidParams(params)
        def eventTeam = new EventTeam(params)

        assert eventTeam.save() != null

        // test invalid parameters in update
        params.id = eventTeam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eventTeam/edit"
        assert model.eventTeamInstance != null

        eventTeam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eventTeam/show/$eventTeam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eventTeam.clearErrors()

        populateValidParams(params)
        params.id = eventTeam.id
        params.version = -1
        controller.update()

        assert view == "/eventTeam/edit"
        assert model.eventTeamInstance != null
        assert model.eventTeamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eventTeam/list'

        response.reset()

        populateValidParams(params)
        def eventTeam = new EventTeam(params)

        assert eventTeam.save() != null
        assert EventTeam.count() == 1

        params.id = eventTeam.id

        controller.delete()

        assert EventTeam.count() == 0
        assert EventTeam.get(eventTeam.id) == null
        assert response.redirectedUrl == '/eventTeam/list'
    }
}
