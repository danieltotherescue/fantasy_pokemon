class UserpokesController < ApplicationController
  before_action :set_userpoke, only: [:show, :edit, :update, :destroy, :vote]

  # GET /userpokes
  # GET /userpokes.json
  def index
    @userpokes = Userpoke.all
  end

  # GET /userpokes/1
  # GET /userpokes/1.json
  def show
  end

  # GET /userpokes/new
  def new
    @userpoke = Userpoke.new
  end

  # GET /userpokes/1/edit
  def edit
  end

  # POST /userpokes
  # POST /userpokes.json
  def create
    @userpoke = Userpoke.new(userpoke_params)

    respond_to do |format|
      if @userpoke.save
        format.html { redirect_to @userpoke, notice: 'Userpoke was successfully created.' }
        format.json { render :show, status: :created, location: @userpoke }
      else
        format.html { render :new }
        format.json { render json: @userpoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userpokes/1
  # PATCH/PUT /userpokes/1.json
  def update
    respond_to do |format|
      if @userpoke.update(userpoke_params)
        format.html { redirect_to @userpoke, notice: 'Userpoke was successfully updated.' }
        format.json { render :show, status: :ok, location: @userpoke }
      else
        format.html { render :edit }
        format.json { render json: @userpoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userpokes/1
  # DELETE /userpokes/1.json
  def destroy
    @userpoke.destroy
    respond_to do |format|
      format.html { redirect_to userpokes_url, notice: 'Userpoke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @userpoke.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userpoke
      @userpoke = Userpoke.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userpoke_params
      params.require(:userpoke).permit(:pokemon_id, :user_id)
    end
end
