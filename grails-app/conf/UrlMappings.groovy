class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        name rules: "/rules" { view = "/rules"}
        name scoring: "/scoring" {view = "/scoring" }

		"/"(view:"/index")
        "/about" view: "/about"
		"500"(view:'/error')
	}
}
