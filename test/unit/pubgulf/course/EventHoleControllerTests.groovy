package pubgulf.course

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(EventHoleController)
@Mock(EventHole)
class EventHoleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eventHole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventHoleInstanceList.size() == 0
        assert model.eventHoleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eventHoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventHoleInstance != null
        assert view == '/eventHole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eventHole/show/1'
        assert controller.flash.message != null
        assert EventHole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eventHole/list'

        populateValidParams(params)
        def eventHole = new EventHole(params)

        assert eventHole.save() != null

        params.id = eventHole.id

        def model = controller.show()

        assert model.eventHoleInstance == eventHole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eventHole/list'

        populateValidParams(params)
        def eventHole = new EventHole(params)

        assert eventHole.save() != null

        params.id = eventHole.id

        def model = controller.edit()

        assert model.eventHoleInstance == eventHole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eventHole/list'

        response.reset()

        populateValidParams(params)
        def eventHole = new EventHole(params)

        assert eventHole.save() != null

        // test invalid parameters in update
        params.id = eventHole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eventHole/edit"
        assert model.eventHoleInstance != null

        eventHole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eventHole/show/$eventHole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eventHole.clearErrors()

        populateValidParams(params)
        params.id = eventHole.id
        params.version = -1
        controller.update()

        assert view == "/eventHole/edit"
        assert model.eventHoleInstance != null
        assert model.eventHoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eventHole/list'

        response.reset()

        populateValidParams(params)
        def eventHole = new EventHole(params)

        assert eventHole.save() != null
        assert EventHole.count() == 1

        params.id = eventHole.id

        controller.delete()

        assert EventHole.count() == 0
        assert EventHole.get(eventHole.id) == null
        assert response.redirectedUrl == '/eventHole/list'
    }
}
