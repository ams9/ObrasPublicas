package util



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TelefoneController {

    static allowedMethods = [update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Telefone.list(params), model:[telefoneInstanceCount: Telefone.count()]
    }

    def show(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    def create() {
        respond new Telefone(params)
    }

    @Transactional
    def save() {
        Telefone telefoneInstance = new Telefone(params)

        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'create'
            return
        }

        telefoneInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*' { respond telefoneInstance, [status: CREATED] }
        }
    }

    def edit(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    @Transactional
    def update(Telefone telefoneInstance) {
        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'edit'
            return
        }

        telefoneInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*'{ respond telefoneInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Telefone telefoneInstance) {

        if (telefoneInstance == null) {
            notFound()
            return
        }

        telefoneInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
