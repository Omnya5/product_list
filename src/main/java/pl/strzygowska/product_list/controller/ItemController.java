package pl.strzygowska.product_list.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import pl.strzygowska.product_list.Item;
import pl.strzygowska.product_list.ItemRepository;

@RestController
public class ItemController {
    @Autowired
    private ItemRepository itemData;
    private final Logger logger = LoggerFactory.getLogger(ItemController.class);
    private RedirectView redirectView = new RedirectView();

    @RequestMapping("/")
    public ModelAndView indexPage(){
        ModelAndView mv = new ModelAndView("index.jsp");
        mv.addObject("list", itemData.findAll());
        return mv;
    }
    @RequestMapping("/add")
    public ModelAndView addingPage(){
        return new ModelAndView("add.jsp");
    }

    @RequestMapping("/update")
    public ModelAndView editPage(){
        return new ModelAndView("update.jsp");
    }

    @RequestMapping("/addItem")
    public RedirectView addItem(Item item) {
        itemData.save(item);
        logger.info("added new item");
        redirectView.setUrl("/");
        return redirectView;
    }

    @RequestMapping("/editItem")
    public RedirectView editItem(Long id, String name, Double price) {
        Item item =  itemData.findById(id).orElse(new Item());
        item.setName(name);
        item.setPrice(price);
        itemData.save(item);
        logger.info("item was edited");
        redirectView.setUrl("/");
        return redirectView;
    }

    @RequestMapping(value="/deleteItem", method={RequestMethod.DELETE, RequestMethod.GET})
    public RedirectView deleteItem(Long id) {
        itemData.deleteById(id);
        logger.info("item was deleted");
        redirectView.setUrl("/");
        return redirectView;
    }
}
