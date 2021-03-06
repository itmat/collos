class ContainerTypesController < ApplicationController
    load_and_authorize_resource

    def index
        @container_types = @container_types.includes(:type => [:ontology]).page(params[:page])
    end
    def show
        @type = @container_type.type
    end

    def new
        # grab container type ontology terms
        @container_type_terms = @container_type.container_type_terms()
    end
    def create
        if @container_type.save
            flash[:success] = "ContainerType successfully created."
            redirect_to @container_type
        else
            render action: 'new'
        end
    end

    def edit
        # grab container type ontology terms
        @container_type_terms = @container_type.container_type_terms()
    end
    def update
        if @container_type.update_attributes(params[:container_type])
            flash[:success] = "ContainerType successfully updated."
            redirect_to @container_type
        else
            render action: 'edit'
        end
    end

    def destroy
        @container_type.destroy
        redirect_to container_types_url, notice: "ContainerType was deleted."
    end

end
