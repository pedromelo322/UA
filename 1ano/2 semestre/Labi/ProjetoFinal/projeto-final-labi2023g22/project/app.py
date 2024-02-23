#encoding=utf-8
#
# Example of a cherrypy application that serves static content as well as dynamic content.
#
# Adrego da Rocha - Fevereiro de 2023
#
# To run: python3 app.py
import base64
import hashlib
from io import BytesIO
import os.path
from PIL import Image
import cherrypy
import sqlite3 as sql
import time
import json
import time

cherrypy.config.update({
	"server.socket_port": 10022,
	'tools.encode.encoding': 'utf-8',					
						})
# The absolute path to this file's base directory
baseDir = os.path.abspath(os.path.dirname(__file__))

# Dictionary with this application's static directories configuration
config = {
			"/":		{	"tools.staticdir.root": baseDir },

			"/html":	{	"tools.staticdir.on": True, "tools.staticdir.dir": "html" },

			"/js":		{	"tools.staticdir.on": True, "tools.staticdir.dir": "js" },

			"/css":		{	"tools.staticdir.on": True, "tools.staticdir.dir": "css" },

			"/images":	{	"tools.staticdir.on": True, "tools.staticdir.dir": "images" }, 

			"/uploads":	{	"tools.staticdir.on": True, "tools.staticdir.dir": "uploads" },   

			"/temp":   {   "tools.staticdir.on": True, "tools.staticdir.dir": "temp" }     
}


class Root(object):
	@cherrypy.expose
	def index(self):
		
		return open("html/index.html")

	@cherrypy.expose
	def upload(self):
		h = hashlib.sha256()

		body = cherrypy.request.body.read()
		data = json.loads(body)
		nome = data.get("nome")
		imagem_bytes = base64.b64decode(data.get("imagem").split(",")[1])

		imagem = Image.open(BytesIO(imagem_bytes))

		diretorio = "uploads"

		lista_arquivos = os.listdir(diretorio)
		numero_arquivos = len(lista_arquivos)


		imagem.save(diretorio + "/" + str(numero_arquivos+1) + ".png")


		date = time.strftime("date: %d-%m-%Y time: %H:%M:%S")

		db = sql.connect("database.db")
		
		print("--------------------------------------------------")
		print("Nome: " + nome)

		# Atualize a linha problemática da seguinte maneira
		db.execute("INSERT INTO images (autor, nome, id, data, comentarios, likes, dislikes) VALUES (?, ?, ?, ?, ?, ?, ?)",
				(user, nome, str(numero_arquivos+1), date, "", "", ""))

		db.commit()

		db.close()

	@cherrypy.expose
	def list(self, id):
		
		db = sql.connect('database.db')
		if (id == "all"):
			result = db.execute("SELECT * FROM images")
		else:
			query = "SELECT * FROM images WHERE autor = ?"
			result = db.execute(query, (id,))
		
		
		
		rows = result.fetchall()
		
		
		db.close()

		# Generate result (list of dictionaries) from rows (list of tuples)
		
		
		# eventually sort result by image name before return

		cherrypy.response.headers["Content-Type"] = "application/json"
		
		return json.dumps({"images": rows}).encode("utf-8")


	@cherrypy.expose
	def dados(self, idimg):
		db = sql.connect("database.db")
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()
 
		
		db.close()
		print("----------------------------------------")
		print(idimg)
		print(json.dumps({"autor": dadosinfo[0], "nome": dadosinfo[1], "id":dadosinfo[2], "data": dadosinfo[3], "comments": dadosinfo[4], "likes": dadosinfo[5], "dislikes": dadosinfo[6]}).encode("utf-8"))
		# Generate output dictionary with image votes
		
		cherrypy.response.headers["Content-Type"] = "application/json"
		return json.dumps({"user": user, "autor": dadosinfo[0], "nome": dadosinfo[1], "id":dadosinfo[2], "data": dadosinfo[3], "comments": dadosinfo[4], "likes": dadosinfo[5], "dislikes": dadosinfo[6]}).encode("utf-8")



	@cherrypy.expose
	def comment(self, idimg, comment):
		db = sql.connect("database.db")
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()

		print("----------------------------------------")
		print(dadosinfo[4])

		comments = dadosinfo[4]
		comments = comments  + user + ": " + comment + ";"

		db.execute("UPDATE images SET comentarios = ? WHERE id = ?", (comments, idimg))
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()
		
		print("----------------------------------------")
		print(dadosinfo[4])
		db.commit()
		db.close()

		cherrypy.response.headers["Content-Type"] = "application/json"
		return json.dumps({"autor": dadosinfo[0], "nome": dadosinfo[1], "id":dadosinfo[2], "data": dadosinfo[3], "comments": dadosinfo[4], "likes": dadosinfo[5], "dislikes": dadosinfo[6]}).encode("utf-8")

	
	
	
	@cherrypy.expose
	def like(self, idimg, like):
		db = sql.connect("database.db")
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()
		

		if (like == "like"):
			if (user in dadosinfo[5]):
				likeDislike(idimg, "like--", db)
			elif (user in dadosinfo[6]):
				likeDislike(idimg, "dislike--", db)
				likeDislike(idimg, "like++", db)
			else:
				likeDislike(idimg, "like++", db)
			
		if (like == "dislike"):
			if (user in dadosinfo[6]):
				likeDislike(idimg, "dislike--", db)
			elif (user in dadosinfo[5]):
				likeDislike(idimg, "like--", db)
				likeDislike(idimg, "dislike++", db)
			else:
				likeDislike(idimg, "dislike++", db)

		
		
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()
		print("----------------------------------------")
		print(dadosinfo[5])
		print("----------------------------------------")	
		print(dadosinfo[6])
		db.commit()
		db.close()

		cherrypy.response.headers["Content-Type"] = "application/json"
		return json.dumps({"user": user, "autor": dadosinfo[0], "nome": dadosinfo[1], "id":dadosinfo[2], "data": dadosinfo[3], "comments": dadosinfo[4], "likes": dadosinfo[5], "dislikes": dadosinfo[6]}).encode("utf-8")



	@cherrypy.expose
	def login(self):
		h = hashlib.sha256()

		body = cherrypy.request.body.read()
		data = json.loads(body)
		nome = data.get("nome")
		password = data.get("password")
		email = data.get("email")

		db = sql.connect("database.db")
		result = db.execute("SELECT * FROM users")
		dados = result.fetchone()
		print(dados)
		

		if (nome == ""):

			result = db.execute("SELECT * FROM users WHERE email = ?", (email,))
			print("--------------------------------------------------")
			dadosemail = result.fetchone()
			print(dadosemail)
			result = db.execute("SELECT * FROM users WHERE password = ?", (password,))
			dadospassword = result.fetchone()

			print(dadosemail, dadospassword)

			if (dadosemail == None or dadospassword == None):
				print(1)
				return "Erro;../html/index.html"
			else:
				print(2)
				result = db.execute("SELECT * FROM users WHERE email = ?", (email,)) 
				dados = result.fetchone()
				result = db.execute("SELECT * FROM users WHERE password = ?", (password,)) 
				dados2 = result.fetchall()


				print("++++++++++++++++++++++++++++++++++++++++")
				print(dados)

				print(dados2)
				print("++++++++++++++++++++++++++++++++++++++++")

				for i in dados2:
					print(i)
					if (dados == i):
						print(3)
						nome = dados[0]
						alterar_user(nome)
						return ";../html/main.html"
					
				return "Dados incorretos;../html/index.html"

			
		else:
			result = db.execute("SELECT * FROM users WHERE email = ?", (email,))
			dadosemail = result.fetchone()

			if (dadosemail != None):

				return "O email fornecido já existe;../html/index.html"
			
				

			db.execute("INSERT INTO users (nome, email, password) VALUES (?, ?, ?)",
				(nome, email, password))

			db.commit()

			db.close()

			return "Conta registada com sucesso;../html/index.html"
		
		
	@cherrypy.expose
	def mudartemp(self, idimg):

		im = Image.open("uploads/" + idimg + ".png")

		im_rgb = im.convert("RGB")

		im_rgb.save("temp/" + idimg + ".jpg", "JPEG")

	@cherrypy.expose
	def salvar(self, idimg):
		im = Image.open("temp/" + idimg + ".jpg")
		

		im.save("uploads/" + idimg + ".png", "PNG")


	@cherrypy.expose
	def alterarImg(self, idimg, tipo):

		print("funciona")
	
		
		if (tipo == "intensidadeMais"):
			print(1)
			aumintensidade(idimg)
			
		elif (tipo == "intensidadeMenos"):
			print(2)
			dimintensidade(idimg)
		elif (tipo == "saturacaoMais"):
			print(3)
			saturação(idimg)
		elif (tipo == "saturacaoMenos"):
			desaturação(idimg)
			print(4)
		elif (tipo == "pretoBranco"):
			imagem = Image.open("temp/" + idimg + ".jpg")

			imagem_pb = imagem.convert("L")

			
			imagem_pb.save("temp/" + idimg + ".jpg")

			print(5)
		elif (tipo == "sepia"):
			print(6)
			sepia(idimg)
		elif (tipo == "trocaCores"):
			trocadecores(idimg)
			print(7)
		elif (tipo == "negativa"):
			imagemnegativa(idimg)
			print(8)

		return "ok"



def aumintensidade(img):
    im = Image.open("temp/" + img + ".jpg")
    intense_im = effect_intensity(im, 2)
    intense_im.save("temp/" + img + ".jpg")

def effect_intensity(im, f):
    width, height = im.size
    for x in range(width):
        for y in range(height):
            pixel = im.getpixel((x, y))
            py = min(255, int(pixel[0] * f))  # [0] é o canal R
            im.putpixel((x, y), (py, pixel[1], pixel[2]))
    return im


def dimintensidade(img):
    im = Image.open("temp/" + img + ".jpg")
    intense_im = effect_intensity(im, 0.5)
    intense_im.save(os.path.join("temp/" + img + ".jpg"))

def saturation_adjust(im, f):
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            py = p[0]
            pb = min(255, int((p[1] - 128) * f) + 128)
            pr = min(255, int((p[2] - 128) * f) + 128)
            im.putpixel((x, y), (py, pb, pr))
    return im

def desaturação(img):
    im = Image.open("temp/" + img + ".jpg")
    width, height = im.size
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            py = p[0]
            pb = min(255, int((p[1] - 128) * 11) + 128)  # Ajuste de saturação com fator 11
            pr = min(255, int((p[2] - 128) * 11) + 128)  # Ajuste de saturação com fator 11
            im.putpixel((x, y), (py, pb, pr))
    im.save(os.path.join("temp/" + img + ".jpg"))

def saturação(img):
    im = Image.open("temp/" + img + ".jpg").convert("RGB")
    width, height = im.size
    for x in range(width):
        for y in range(height):
            r, g, b = im.getpixel((x, y))
            py = r
            pb = min(255, int((g - 128) * 150) + 128)  # Ajuste de saturação com fator 150
            pr = min(255, int((b - 128) * 150) + 128)  # Ajuste de saturação com fator 150
            im.putpixel((x, y), (py, pb, pr))
    im.save(os.path.join("temp/" + img + ".jpg"))



def sepia(img):
    im = Image.open("temp/" + img + ".jpg")
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            # Check if p is an RGB tuple
            if isinstance(p, tuple) and len(p) == 3:
                # Apply the transformation equations
                r = 0.189 * p[0] + 0.769 * p[1] + 0.393 * p[2]
                g = 0.168 * p[0] + 0.686 * p[1] + 0.349 * p[2]
                b = 0.131 * p[0] + 0.534 * p[1] + 0.272 * p[2]
                # Normalize the RGB values to the [0, 255] range
                r = min(max(int(r), 0), 255)
                g = min(max(int(g), 0), 255)
                b = min(max(int(b), 0), 255)
                new_im.putpixel((x, y), (r, g, b))
    new_im.save(os.path.join("temp/" + img + ".jpg"))



def imagemnegativa(img):

	im = Image.open("temp/" + img + ".jpg")
	width, height = im.size
	new_im = Image.new(im.mode, im.size)
	for x in range(width):
		for y in range(height):
			p = im.getpixel((x, y))
			r = 255 - p[1]
			g = 255 - p[0]
			b = 255 - p[2]
			new_im.putpixel((x, y), (r, g, b))
	new_im.save(os.path.join("temp/" + img + ".jpg"))

def trocadecores(img):
    im = Image.open("temp/" + img + ".jpg")
    width, height = im.size
    new_im = Image.new(im.mode, im.size)
    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            r = p[1]
            g = p[0]
            b = p[2]
            new_im.putpixel((x, y), (r, g, b))
    new_im.save(os.path.join("temp/", img + ".jpg"))
    



def alterar_user(user_atual):
	global user
	user = user_atual
			
def likeDislike(idimg, like, db):
		
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		dadosinfo = result.fetchone()

		likes = dadosinfo[5]
		dislikes = dadosinfo[6]
		print(like)
		if (like == "like++"):
			
			likes = likes + user + ";"
			db.execute("UPDATE images SET likes = ? WHERE id = ?", (likes, idimg))
			print(1)
		if (like == "like--"):
			likes = likes.replace(user + ";", "")
			db.execute("UPDATE images SET likes = ? WHERE id = ?", (likes, idimg))
			print(2)
		if (like == "dislike++"):
			dislikes = dislikes + user + ";"
			db.execute("UPDATE images SET dislikes = ? WHERE id = ?", (dislikes, idimg))
			print(3)
		if (like == "dislike--"):
			print(4)
			dislikes = dislikes.replace(user + ";", "")
			db.execute("UPDATE images SET dislikes = ? WHERE id = ?", (dislikes, idimg))
		
	
	
	




cherrypy.quickstart(Root(), "/", config)
