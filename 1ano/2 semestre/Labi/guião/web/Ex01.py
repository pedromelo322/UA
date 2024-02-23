import cherrypy

class Node(object):
    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Node (Node.index)"

    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Node (Node.page)"


class Actions(object):
    @cherrypy.expose
    def doLogin(self, username=None, password=None):
        print(username, password)
        # Lógica para verificar as credenciais do usuário

        # Redirecionar para uma página de confirmação após o login
        raise cherrypy.HTTPRedirect("/login_success")

class Root(object):
    def __init__(self):
        self.node = Node()
        self.actions = Actions()
    
    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Root (Root.index)"

    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Root (Root.page)"
    
    @cherrypy.expose
    def form(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("formulario.html")

    @cherrypy.expose
    def login_success(self):
        return "Login realizado com sucesso!"

if __name__ == "__main__":
    cherrypy.quickstart(Root(), "/")
