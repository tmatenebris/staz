require 'open-uri'


def download (x,y)
	URI.open(x) {|f|
		file = File.open(y, 'wb')
		file.write(f.read)
		file.close
		}	
end

url = /https:\/\/imgs\.xkcd\.com\/comics\/.+\.\w{3,4}/



html = File.open "indeks.html" , "w"

html.write('<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Memes</title>
  </head>
  <body>
  ')
  
  
  numbers = File.open("nr.txt", "r") do |file|
    file.each_line("\n"){ |line|
  
	
     URI.open("https://xkcd.com/#{line.strip}/info.0.json") {|f|
	   content = f.read
	 
	   if content=~url
		  a=$&
		  download("#{a.strip}", "obrazek#{line.strip}")
	   end
	
	   html.write('<img src="obrazek')
	   html.write("#{line.strip}\"")
	   html.write(' class="img-fluid"')
	   html.write(' alt="nie mozna"> </br>')
   }
   }
   end

numbers.close

html.write('<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>')

html.close


