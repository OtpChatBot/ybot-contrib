/*
 * Ybot returns random 9gag image
 *
 * Usage:
 *    Ybot 9gag
 */

 import scala.io.Source
 import scala.xml.XML

 object gag {

 	def main(args: Array[String]) {
 	    // api url
 	    val api_url : String = "http://9gag.com/random"
 	    // get 9gag html page
 	    val html = Source.fromURL(api_url).mkString
 	    //img-wrap
 	    val index1 = html.indexOfSlice("<div class=\"img-wrap\">")
 	    val index2 = html.indexOfSlice("</div><!--end img-wrap-->")
 	    println("http:" + html.slice(index1, index2).split("src=\"")(1).split("\"")(0))
 	}
 	
 }