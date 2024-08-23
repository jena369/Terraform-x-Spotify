resource "spotify_playlist" "Underrated" {
  name = "Underrated"
  tracks = ["5PUkJvKMnevgDUktjt5DR2"]
}

data "spotify_search_track" "hanumankind" {
  artist = "Hanumankind"
  
}

resource "spotify_playlist" "BIG_DAWG" {
    name = "BIG_DAWG"
    tracks = [ data.spotify_search_track.hanumankind.tracks[0].id, data.spotify_search_track.hanumankind.tracks[2].id, 
    data.spotify_search_track.hanumankind.tracks[1].id ]
}

data "spotify_album" "ft_HAVOC_BROTHERS" {
  spotify_id = "666d9PNXmiyefgWdJpZbgG"
}

resource "spotify_library_albums" "COME_LETS_FLOAT" {
  albums = [
    data.spotify_album.ft_HAVOC_BROTHERS.id,
  ]
}


data "spotify_track" "HUSN" {
    url = "https://open.spotify.com/track/0TL0LFcwIBF5eX7arDIKxY"
}

data "spotify_track" "Pehle_Bhi_Main" {
    url = "https://open.spotify.com/track/7yDHHVKLbvDmVw1XXhDDIO"
}


resource "spotify_library" "Meh_Lib" {
    tracks = [data.spotify_track.HUSN.id, data.spotify_track.Pehle_Bhi_Main.id]
}