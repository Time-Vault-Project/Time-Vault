class JournalsController < ApplicationController
  before_action :find_journal, only: %i[show edit update destroy]

  def index
    @journal = user_journals.new
    @journals = user_journals.order(created_at: :desc)
    @pagy, @journals = pagy_countless(@journals)
  end

  def show; end

  def new
    @journal = user_journals.new
  end

  def create
    @journal = user_journals.new(journal_params)
    if @journal.save
      redirect_to journals_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @journal.update(journal_params)
      redirect_to journals_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to journals_path if @journal.destroy
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :content, :date)
  end

  def user_journals
    current_user.journals
  end

  def find_journal
    @journal = user_journals.find_by(id: params[:id])
  end
end
