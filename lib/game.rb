class Game
  THROWS = %w[rock paper scissors].freeze
  DEFEAT = { 'rock' => 'scissors', 'scissors' => 'paper', 'paper' => 'rock' }.freeze
  URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'.freeze

  def initialize; end

  def throw(user_throw)
    rival_throw = request_throw
    result = if rival_throw == user_throw
               'tie'
             elsif rival_throw == self.class::DEFEAT.dig(user_throw)
               'win'
             else
               'lose'
             end

    { state: result, opponent: rival_throw }
  end

  private

  def request_throw
    http_res = HTTParty.get(self.class::URL).parsed_response.fetch(
      'body',
      self.class::THROWS.sample
    ).delete('\"')
    self.class::THROWS.include?(http_res) ? http_res : self.class::THROWS.sample
  rescue StandardError
    self.class::THROWS.sample
  end
end
