class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
    @views_chart = get_all_views(@episodes)
    @change_chart = get_all_differences(@episodes)
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @views_chart = get_views(@episode)
    @change_chart = get_differences(@episode)
  end

  # GET /episodes/new
  def new
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    def get_views(episode)
      chart = Hash.new
      episode.snapshots.each do |snapshot|
        chart[snapshot.date] = snapshot.views
      end
      chart
    end

    def get_differences(episode)
      chart = Hash.new
      episode.snapshots.each do |snapshot|
        last_snapshot_date = snapshot.date - 1
        last_snapshot = episode.snapshots.where(:date => last_snapshot_date).first
        if last_snapshot
          chart[snapshot.date] = snapshot.views - last_snapshot.views
        end
      end
      chart
    end

    def get_all_views(episodes)
      chart = Array.new
      episodes.each do |episode|
        episode_hash = Hash.new
        episode_hash["name"] = episode.title
        episode_hash["data"] = get_views(episode)
        chart << episode_hash
      end
      chart
    end

    def get_all_differences(episodes)
      chart = Array.new
      episodes.each do |episode|
        episode_hash = Hash.new
        episode_hash["name"] = episode.title
        episode_hash["data"] = get_differences(episode)
        chart << episode_hash
      end
      chart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:title, :url, :published, :source)
    end
end
