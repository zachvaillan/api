# frozen_string_literal: true

module Admin
  class OrganizationsController < ApplicationController
    def index
      @organizations = Organization.all
    end

    def show
      @organization = Organization.find(params[:id])
    end

    def new
      @organization = Organization.new
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to organizations_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @organization = Organization.find(params[:id])
    end

    def update
      @organization = Organization.find(params[:id])
      if @organization.update(organization_params)
        redirect_to @organization
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @organization = Organization.find(params[:id])
      @organization.destroy
      redirect_to organizations_path, status: :see_other
    end

    private

    def organization_params
      params.require(:organization).permit(:name)
    end
  end
end
