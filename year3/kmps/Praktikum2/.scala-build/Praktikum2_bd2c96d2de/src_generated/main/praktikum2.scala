



final class praktikum2$_ {
def args = praktikum2_sc.args$
def scriptPath = """praktikum2.sc"""
/*<script>*/
import scala.io.Source

case class Track(title: String, length: String, rating: Int, features: List[String], writers: List[String])
case class Album(title: String, date: String, artist: String, tracks: List[Track])

val home = System.getProperty("user.home")
val albums = Source.fromFile(s"$home/IdeaProjects/untitled/alben.xml").toList

// println(albums.size)
//println(albums)


def parseTrack(source: List[String], TrackList: List[Track], myTrack: Track): List[Track] = source match {
  case "feature"::x::xs => parseTrack(xs, TrackList, myTrack.copy(features = myTrack.features :+ x))
  case "writing"::x::xs => parseTrack(xs, TrackList, myTrack.copy(writers =  myTrack.writers :+ x))
  case "title"::x::xs => parseTrack(xs, TrackList, myTrack.copy(title = x))
  case "length"::x::xs => parseTrack(xs, TrackList, myTrack.copy(length = x))
  case "rating"::x::xs => parseTrack(xs, TrackList, myTrack.copy(rating = x.toInt))
  case "/track"::xs => TrackList :+ myTrack
  case _::xs => parseTrack(xs, TrackList, myTrack)
  case Nil => Nil
}

def parseAlbum(source: List[String], myAlbum: Album):Album = source match {
  case "track"::xs => parseAlbum(xs, myAlbum.copy(tracks=parseTrack(xs, myAlbum.tracks, Track("","",0,Nil,Nil))))
  case "title"::x::xs => parseAlbum(xs, myAlbum.copy(title=x))
  case "artist"::x::xs => parseAlbum(xs, myAlbum.copy(artist=x))
  case "date"::x::xs => parseAlbum(xs, myAlbum.copy(date=x))
  case "/album"::xs => myAlbum
  case _::xs => parseAlbum(xs, myAlbum)
  case Nil => myAlbum
}

def parseFile(source:List[String]): List[Album] = source match {
  case "album"::xs => parseAlbum(xs, Album("","","",Nil))::parseFile(xs)
  case _::xs => parseFile(xs)
  case Nil => Nil
}

def createTokenListInsideBracket(album: List[Char], myString: String): String = album match {
  case Nil => ""
  case '>'::xs => myString
  case x::xs => createTokenListInsideBracket(xs, myString+x)
}


def createTokenListOutsideBracket(album: List[Char], myString: String):String = album match {
  case Nil => ""
  case '<'::xs => myString
  case x::xs => createTokenListOutsideBracket(xs, myString+x)
}

def createTokenList(album: List[Char]): List[String] = album match {
  case Nil => Nil
  case '<'::xs => createTokenListInsideBracket(xs, "") :: createTokenList(xs)
  case '>'::xs => createTokenListOutsideBracket(xs, "") :: createTokenList(xs)
  case _::xs => createTokenList(xs)
}

val Zwischen = createTokenList(albums)
val Endergebnis = parseFile(Zwischen)
println(Endergebnis)

/*</script>*/ /*<generated>*/
/*</generated>*/
}

object praktikum2_sc {
  private var args$opt0 = Option.empty[Array[String]]
  def args$set(args: Array[String]): Unit = {
    args$opt0 = Some(args)
  }
  def args$opt: Option[Array[String]] = args$opt0
  def args$: Array[String] = args$opt.getOrElse {
    sys.error("No arguments passed to this script")
  }

  lazy val script = new praktikum2$_

  def main(args: Array[String]): Unit = {
    args$set(args)
    script.hashCode() // hashCode to clear scalac warning about pure expression in statement position
  }
}

export praktikum2_sc.script as praktikum2

