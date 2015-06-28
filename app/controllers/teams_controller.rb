class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def visualisation
    @team_labels = []
    Team.all.each do |team|
      @team_labels << team.name
    end

    @team_overview_data = {
      lables: @team_labels,
      data_set: generate_data(2008)
    }

  end

  def generate_data(year)
    team_data = []

    i = 0
    GameMatch.where(year: year).where(home_team: "Southern Steel").all.each do |game|
      team_data << {i: i, score: [game.home_score, game.away_score], x: game.home_score, y: game.away_score, other_team_name: game.away_team}
      i += 1
    end
    GameMatch.where(away_team: "Southern Steel").each do |game|
      team_data << {i: i, score: [game.away_score, game.home_score], x: game.away_score, y: game.home_score, other_team_name: game.home_team}
      i += 1
    end
    team_data
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :country, :region)
    end
end
