class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    # @users = User.paginate(page: params[:page], per_page: 5)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      # format.html { redirect_to @user, notice: "User was successfully created." }
      # format.json { render :show, status: :created, location: @user }
    else
      puts "Error while creating data"
      # render "new"
      puts "Error is given here ------------>    #{@user.errors}"
      puts "Error.any? is given here ------------>    #{@user.errors.any?}"
      puts "Error full msg is given here ------------>    #{@user.errors.full_messages}"
      # redirect_to new_user_path
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_param)
      redirect_to users_path
      # redirect_to :action => "list"
      # format.html { redirect_to @user, notice: "User was successfully created." }
      # format.json { render :show, status: :created, location: @user }
    else
      puts "Error while creating data"
      puts "Error full msg is given here ------------>    #{@user.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:firstName, :lastName, :userName, :mobile, :email, :bio)
  end

  def user_param
    params.require(:user).permit(:firstName, :lastName, :userName, :mobile, :email, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
