class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :edit, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @departments = Department.new
    render partial: "departments/form"
  end

  def edit
    render partial: "departments/form"
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def update
    if @department.update(department_params)
      redirect_to @department
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

private

def set_department
  @department = Department.find(params[:id])
end

def department_params
  params.require(:department).permit(:name)
end
end


