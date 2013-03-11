package pubgulf.course

import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(ScoreCardController)
@Mock(ScoreCard)
class ScoreCardControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/scoreCard/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.scoreCardInstanceList.size() == 0
        assert model.scoreCardInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.scoreCardInstance != null
    }

    void testSave() {
        controller.save()

        assert model.scoreCardInstance != null
        assert view == '/scoreCard/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/scoreCard/show/1'
        assert controller.flash.message != null
        assert ScoreCard.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/scoreCard/list'

        populateValidParams(params)
        def scoreCard = new ScoreCard(params)

        assert scoreCard.save() != null

        params.id = scoreCard.id

        def model = controller.show()

        assert model.scoreCardInstance == scoreCard
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/scoreCard/list'

        populateValidParams(params)
        def scoreCard = new ScoreCard(params)

        assert scoreCard.save() != null

        params.id = scoreCard.id

        def model = controller.edit()

        assert model.scoreCardInstance == scoreCard
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/scoreCard/list'

        response.reset()

        populateValidParams(params)
        def scoreCard = new ScoreCard(params)

        assert scoreCard.save() != null

        // test invalid parameters in update
        params.id = scoreCard.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/scoreCard/edit"
        assert model.scoreCardInstance != null

        scoreCard.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/scoreCard/show/$scoreCard.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        scoreCard.clearErrors()

        populateValidParams(params)
        params.id = scoreCard.id
        params.version = -1
        controller.update()

        assert view == "/scoreCard/edit"
        assert model.scoreCardInstance != null
        assert model.scoreCardInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/scoreCard/list'

        response.reset()

        populateValidParams(params)
        def scoreCard = new ScoreCard(params)

        assert scoreCard.save() != null
        assert ScoreCard.count() == 1

        params.id = scoreCard.id

        controller.delete()

        assert ScoreCard.count() == 0
        assert ScoreCard.get(scoreCard.id) == null
        assert response.redirectedUrl == '/scoreCard/list'
    }
}
