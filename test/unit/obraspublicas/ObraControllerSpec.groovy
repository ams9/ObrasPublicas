package obraspublicas



import grails.test.mixin.*
import spock.lang.*

@TestFor(ObraController)
@Mock(Obra)
class ObraControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.obraInstanceList
            model.obraInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.obraInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def obra = new Obra()
            obra.validate()
            controller.save(obra)

        then:"The create view is rendered again with the correct model"
            model.obraInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            obra = new Obra(params)

            controller.save(obra)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/obra/show/1'
            controller.flash.message != null
            Obra.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def obra = new Obra(params)
            controller.show(obra)

        then:"A model is populated containing the domain instance"
            model.obraInstance == obra
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def obra = new Obra(params)
            controller.edit(obra)

        then:"A model is populated containing the domain instance"
            model.obraInstance == obra
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/obra/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def obra = new Obra()
            obra.validate()
            controller.update(obra)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.obraInstance == obra

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            obra = new Obra(params).save(flush: true)
            controller.update(obra)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/obra/show/$obra.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/obra/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def obra = new Obra(params).save(flush: true)

        then:"It exists"
            Obra.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(obra)

        then:"The instance is deleted"
            Obra.count() == 0
            response.redirectedUrl == '/obra/index'
            flash.message != null
    }
}
