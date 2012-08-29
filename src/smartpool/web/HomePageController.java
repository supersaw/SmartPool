package smartpool.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/")
@Controller
public class HomePageController {
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }
}


