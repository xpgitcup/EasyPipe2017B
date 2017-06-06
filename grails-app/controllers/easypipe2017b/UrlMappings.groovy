package easypipe2017b

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "/"(view:"/indexEasyPipe")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
