package pubgulf.course

import org.springframework.dao.DataIntegrityViolationException

class ScoreCardController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scoreCardInstanceList: ScoreCard.list(params), scoreCardInstanceTotal: ScoreCard.count()]
    }

    def create() {
        switch (request.method) {
            case 'GET':
                [scoreCardInstance: new ScoreCard(params)]
                break
            case 'POST':
                def scoreCardInstance = new ScoreCard(params)
                if (!scoreCardInstance.save(flush: true)) {
                    render view: 'create', model: [scoreCardInstance: scoreCardInstance]
                    return
                }

                flash.message = message(code: 'default.created.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), scoreCardInstance.id])
                redirect action: 'show', id: scoreCardInstance.id
                break
        }
    }

    def show() {
        def scoreCardInstance = ScoreCard.get(params.id)
        if (!scoreCardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
            redirect action: 'list'
            return
        }

        [scoreCardInstance: scoreCardInstance]
    }

    def edit() {
        switch (request.method) {
            case 'GET':
                def scoreCardInstance = ScoreCard.get(params.id)
                if (!scoreCardInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
                    redirect action: 'list'
                    return
                }

                [scoreCardInstance: scoreCardInstance]
                break
            case 'POST':
                def scoreCardInstance = ScoreCard.get(params.id)
                if (!scoreCardInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (scoreCardInstance.version > version) {
                        scoreCardInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'scoreCard.label', default: 'ScoreCard')] as Object[],
                                "Another user has updated this ScoreCard while you were editing")
                        render view: 'edit', model: [scoreCardInstance: scoreCardInstance]
                        return
                    }
                }

                scoreCardInstance.properties = params

                if (!scoreCardInstance.save(flush: true)) {
                    render view: 'edit', model: [scoreCardInstance: scoreCardInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), scoreCardInstance.id])
                redirect action: 'show', id: scoreCardInstance.id
                break
        }
    }

    def delete() {
        def scoreCardInstance = ScoreCard.get(params.id)
        if (!scoreCardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
            redirect action: 'list'
            return
        }

        try {
            scoreCardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scoreCard.label', default: 'ScoreCard'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
