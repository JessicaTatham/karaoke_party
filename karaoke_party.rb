class Viewer
  def welcome
    puts "Welcome to Karaoke Party!"
  end
  def instructions
    puts "Please choose an option:"
    puts "add song"
    puts "next song"
    puts "skip song"
    puts "random song"
    puts "show queue"
    puts "clear all"
    puts "end party"
    gets.chomp
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
      return {singer:name, cell_number:cell_number, song_name:song, artist_name:artist}
  end
  def show_queue(songs)
    description = ["fantastic", "amazing", "wonderful", "extremely talented", "beautiful", "sort of okay", "tone-deaf", "magnificent"]
    songs.each_with_index do |song, ind|
      puts "#{ind+1}. #{song.song_name} performed by the #{description.shuffle.first}, #{song.user.singer}."
  end
  def end_party
    puts "Thank you for using Karaoke Party!!! You are a GREAT singer!"
  end
  def invalid
    puts "We don't understand your input. Please try again!"
  end
end

class Controller
  def initialize
    view = Viewer.new
    song_list = SongList.new
    start_party
  end
  def start_party
    view.welcome
    run(view.instructions)
  end
  def run(input)
    case input
      when "add song"
        song_list.add_song(view.add_song)
      when "skip song"
        song_list.skip_song
      when "next song"
        song_list.next_song
      when "random_song"
        song_list.random_song
      when "clear all"
        song_list.clear_all
      when "show queue"
        view.show_queue(song_list.show_queue)
      when "end party"
        view.end_party
        return
      else
        view.invalid
      end
      run(view.instructions)
  end
end

class SongList
  def initialize
    list = []
  end

  def add_song(args)
    list << Song.new(args)
  end
  def skip_song
    list.shift
    next_song
  end
  def next_song
    list.shift
  end
  def clear_all
    list = []
  end
  def random_song
  end
  def show_queue
    list
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

