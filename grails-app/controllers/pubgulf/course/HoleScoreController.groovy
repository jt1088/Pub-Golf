package pubgulf.course

import org.springframework.dao.DataIntegrityViolationException

class HoleScoreController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [holeScoreInstanceList: HoleScore.list(params), holeScoreInstanceTotal: HoleScore.count()]
    }

    def create() {
        switch (request.method) {
            case 'GET':
                [holeScoreInstance: new HoleScore(params)]
                break
            case 'POST':
                def holeScoreInstance = new HoleScore(params)
                if (!holeScoreInstance.save(flush: true)) {
                    render view: 'create', model: [holeScoreInstance: holeScoreInstance]
                    return
                }

                flash.message = message(code: 'default.created.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), holeScoreInstance.id])
                redirect action: 'show', id: holeScoreInstance.id
                break
        }
    }

    def show() {
        def holeScoreInstance = HoleScore.get(params.id)
        if (!holeScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
            redirect action: 'list'
            return
        }

        [holeScoreInstance: holeScoreInstance]
    }

    def edit() {
        switch (request.method) {
            case 'GET':
                def holeScoreInstance = HoleScore.get(params.id)
                if (!holeScoreInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
                    redirect action: 'list'
                    return
                }

                [holeScoreInstance: holeScoreInstance]
                break
            case 'POST':
                def holeScoreInstance = HoleScore.get(params.id)
                if (!holeScoreInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (holeScoreInstance.version > version) {
                        holeScoreInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'holeScore.label', default: 'HoleScore')] as Object[],
                                "Another user has updated this HoleScore while you were editing")
                        render view: 'edit', model: [holeScoreInstance: holeScoreInstance]
                        return
                    }
                }

                holeScoreInstance.properties = params

                if (!holeScoreInstance.save(flush: true)) {
                    render view: 'edit', model: [holeScoreInstance: holeScoreInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), holeScoreInstance.id])
                redirect action: 'show', id: holeScoreInstance.id
                break
        }
    }

    def delete() {
        def holeScoreInstance = HoleScore.get(params.id)
        if (!holeScoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
            redirect action: 'list'
            return
        }

        try {
            holeScoreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'holeScore.label', default: 'HoleScore'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
