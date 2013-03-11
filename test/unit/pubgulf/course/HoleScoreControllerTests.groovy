package pubgulf.course

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(HoleScoreController)
@Mock(HoleScore)
class HoleScoreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/holeScore/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.holeScoreInstanceList.size() == 0
        assert model.holeScoreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.holeScoreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.holeScoreInstance != null
        assert view == '/holeScore/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/holeScore/show/1'
        assert controller.flash.message != null
        assert HoleScore.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/holeScore/list'

        populateValidParams(params)
        def holeScore = new HoleScore(params)

        assert holeScore.save() != null

        params.id = holeScore.id

        def model = controller.show()

        assert model.holeScoreInstance == holeScore
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/holeScore/list'

        populateValidParams(params)
        def holeScore = new HoleScore(params)

        assert holeScore.save() != null

        params.id = holeScore.id

        def model = controller.edit()

        assert model.holeScoreInstance == holeScore
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/holeScore/list'

        response.reset()

        populateValidParams(params)
        def holeScore = new HoleScore(params)

        assert holeScore.save() != null

        // test invalid parameters in update
        params.id = holeScore.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/holeScore/edit"
        assert model.holeScoreInstance != null

        holeScore.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/holeScore/show/$holeScore.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        holeScore.clearErrors()

        populateValidParams(params)
        params.id = holeScore.id
        params.version = -1
        controller.update()

        assert view == "/holeScore/edit"
        assert model.holeScoreInstance != null
        assert model.holeScoreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/holeScore/list'

        response.reset()

        populateValidParams(params)
        def holeScore = new HoleScore(params)

        assert holeScore.save() != null
        assert HoleScore.count() == 1

        params.id = holeScore.id

        controller.delete()

        assert HoleScore.count() == 0
        assert HoleScore.get(holeScore.id) == null
        assert response.redirectedUrl == '/holeScore/list'
    }
}
