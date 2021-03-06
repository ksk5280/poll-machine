class Api::V1::AnswersController < ApiController
  def create
    poll = Poll.find(params[:poll_id].to_i)
    answer = poll.answers.create(answer_params)
    respond_with answer, json: answer
  end

  def update
    answerId = params[:answerId].to_i
    Answer.find(answerId).update(answer_params)
    answer = Answer.find(answerId)
    respond_with answer, json: answer
  end

  def show
    votes = Answer.find(params[:id].to_i).votes.count
    respond_with votes
  end

  private
    def answer_params
      params.permit(:description)
    end
end
