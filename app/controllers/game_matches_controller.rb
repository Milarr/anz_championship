class GameMatchesController < ApplicationController
  before_action :set_game_match, only: [:show, :edit, :update, :destroy]

  # GET /game_matches
  # GET /game_matches.json
  def index
    @game_matches = GameMatch.all
    # GameMatch.import
  end

  # GET /game_matches/1
  # GET /game_matches/1.json
  def show
  end

  # GET /game_matches/new
  def new
    @game_match = GameMatch.new
  end

  # GET /game_matches/1/edit
  def edit
  end

  # POST /game_matches
  # POST /game_matches.json
  def create
    @game_match = GameMatch.new(game_match_params)

    respond_to do |format|
      if @game_match.save
        format.html { redirect_to @game_match, notice: 'Game match was successfully created.' }
        format.json { render :show, status: :created, location: @game_match }
      else
        format.html { render :new }
        format.json { render json: @game_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_matches/1
  # PATCH/PUT /game_matches/1.json
  def update
    respond_to do |format|
      if @game_match.update(game_match_params)
        format.html { redirect_to @game_match, notice: 'Game match was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_match }
      else
        format.html { render :edit }
        format.json { render json: @game_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_matches/1
  # DELETE /game_matches/1.json
  def destroy
    @game_match.destroy
    respond_to do |format|
      format.html { redirect_to game_matches_url, notice: 'Game match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def visualisation
    @team_labels = []
    Team.all.each do |team|
      @team_labels << team.name
    end
    @game_match_data = {
      labels: @team_labels,
      matrix: generate_data(2013)
    }
  end

  def generate_data(year)
    team_matrix = Array.new(@team_labels.count) { Array.new(@team_labels.count, 0)}
    GameMatch.where(year: year).all.each do |match|
      home_team_index = @team_labels.find_index(match.home_team)
      away_team_index = @team_labels.find_index(match.away_team)
      team_matrix[home_team_index][away_team_index] += match.home_score
      team_matrix[away_team_index][home_team_index] += match.away_score
    end
    team_matrix
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_match
      @game_match = GameMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_match_params
      params.require(:game_match).permit(:year, :round, :date, :home_team, :away_team, :home_score, :away_score, :venue)
    end
end
