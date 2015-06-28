class GameMatch < ActiveRecord::Base
  require 'csv'

  has_and_belongs_to_many :teams

  def self.link_games_teams
    GameMatch.each do |game|
      game.teams
    end
  end

  def self.import
    create_record(2008,'2008-Table1.csv')
    create_record(2009,'2009-Table1.csv')
    create_record(2010,'2010-Table1.csv')
    create_record(2011,'2011-Table1.csv')
    create_record(2012,'2012-Table1.csv')
    create_record(2013,'2013-Table1.csv')
  end

  def self.create_record (year, file)
    CSV.foreach(file, headers: true) do |row|
      next if row["Date"].starts_with?("BYES")
      csv_time = row["Time"].nil? ? "" : row["Time"]
      csv_date = row["Date"]

      date = DateTime.parse(csv_date + " " + csv_time)
      GameMatch.create(
        year: year,
        round: row["Round"],
        date: date,
        home_team: row["Home Team"],
        away_team: row["Away Team"],
        home_score: row["Score"].nil? ? nil : row["Score"].split('–')[0],
        away_score: row["Score"].nil? ? nil : row["Score"].split('–')[1],
        venue: row["Venue"]
      )
    end
  end
end
