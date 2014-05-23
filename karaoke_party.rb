class Viewer
  def welcome
    puts "Welcome to Karaoke Party!"
  end
  def instructions
    #add_song
    #end_party
    #random_song
    #show queue
    #next_song
    #clear_all
    #skip_song
  end
  def add_song
    puts "What is your name?"
      name = gets.chomp
    puts "What is your cell phone number?"
      cell_number = gets.chomp
    puts "What is the song you would like to sing?"
      song = gets.chomp
    puts "What is the name of the artist?"
      artist = gets.chomp
  end
end

class Controller
  def initialize
    view = Viewer.new
    song_list = SongList.new
    view.welcome
    start_party
  end
  def start_party
    #lists out instructions
    #creates list, asks for new song
    song_list
    run
  end
  def run
    case input
      when "add nsong"
        view.add_song
      when "skip song"


  end
  def end_party
    #quits the application
  end
end
# *****************************************
class SongList
  def initialize
    list = []
  end

  def add_song
    puts ""
    list << Song.new(args)
  end
  def skip_song
  end
  def next_song
  end
  def clear_all
  end
  def random_song
  end
  def show_queue
  end

end
# *****************************************
class Song
  def initialize(args)
    @song_name = args[:song_name]
    @artist_name = args[:artist_name] || nil
    @user = User.new(args)
    @link = nil
  end
  #Youtube API
end

class User
  def initialize(args)
    @singer = args[:singer]
    @cell_number = args[:cell_number]
  end
end

Controller.new

###SPIKES###
#text whoever is next in queue
#multiple parties
#song lyrics
#database of karaoke parties
#microphone phone
#rate users
#lyrics on phone - texted to you
#

