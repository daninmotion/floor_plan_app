class FloorPlansController < ApplicationController
  before_action :set_floor_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @floor_plans = FloorPlan.all
    respond_with(@floor_plans)
  end

  def show
    respond_with(@floor_plan)
  end

  def new
    @floor_plan = FloorPlan.new
    respond_with(@floor_plan)
  end

  def edit
  end

  def create
    @floor_plan = FloorPlan.new(floor_plan_params)
    @floor_plan.save
    respond_with(@floor_plan)
  end

  def update
    @floor_plan.update(floor_plan_params)
    respond_with(@floor_plan)
  end

  def destroy
    @floor_plan.destroy
    respond_with(@floor_plan)
  end

  private
    def set_floor_plan
      @floor_plan = FloorPlan.find(params[:id])
    end

    def floor_plan_params
      params.require(:floor_plan).permit(:user_id, :title, :image)
    end
end
