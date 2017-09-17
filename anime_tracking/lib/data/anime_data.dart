class Anime {

  final String id;
  final String name;
  final String type;

  final String plot;
  final String cover;

  final String tags;
  final String rating;


  const Anime({this.id, this.name, this.type, this.plot, this.cover, this.tags,
    this.rating});

  Anime.fromMap(Map<String, dynamic>  map) :
        id = map['id'],
        name = map['name'],
        type = map['type'],
        plot = map['plot'],
        cover = map['cover'],
        tags = map['tags'],
        rating = map['rating'];
}