final Set<VideoObject> audioExamples = {
  VideoObject(
    'Salt & Pepper',
    'Dope Lemon',
    'https://m.media-amazon.com/images/I/81UYWMG47EL._SS500_.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/rio_from_above_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Losing It',
    'FISHER',
    'https://m.media-amazon.com/images/I/9135KRo8Q7L._SS500_.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/the_valley_compressed.mp4?raw=true',
  ),
  VideoObject(
    'American Kids',
    'Kenny Chesney',
    'https://cdn.playbuzz.com/cdn/7ce5041b-f9e8-4058-8886-134d05e33bd7/5c553d94-4aa2-485c-8a3f-9f496e4e4619.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/iceland_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Wake Me Up',
    'Avicii',
    'https://upload.wikimedia.org/wikipedia/en/d/da/Avicii_Wake_Me_Up_Official_Single_Cover.png',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Missing You',
    'Mesto',
    'https://img.discogs.com/EcqkrmOCbBguE3ns-HrzNmZP4eM=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-12539198-1537229070-5497.jpeg.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Drop it dirty',
    'Tavengo',
    'https://images.shazam.com/coverart/t416659652-b1392404277_s400.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Cigarettes',
    'Tash Sultana',
    'https://m.media-amazon.com/images/I/91vBpel766L._SS500_.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true',
  ),
  VideoObject(
    'Ego Death',
    'Ty Dolla \$ign, Kanye West, FKA Twigs, Skrillex',
    'https://static.stereogum.com/uploads/2020/06/Ego-Death-1593566496.jpg',
    'https://github.com/GeekyAnts/flick-video-player-demo-videos/blob/master/example/9th_may_compressed.mp4?raw=true',
  ),
};

final class VideoObject {
  final String title;
  final String artist;
  final String imageUrl;
  final String videoUrl;

  VideoObject(this.title, this.artist, this.imageUrl, this.videoUrl);
}
