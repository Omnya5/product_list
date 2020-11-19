package pl.strzygowska.product_list.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.strzygowska.product_list.Item;
import pl.strzygowska.product_list.ItemRepository;

@RestController
public class ItemController {
    @Autowired
    ItemRepository itemData;

    @RequestMapping("/")
    public ModelAndView indexPage(){
        ModelAndView mv = new ModelAndView("index.jsp");
        mv.addObject("list", itemData.findAll());
        return mv;
    }
    @RequestMapping("/add")
    public ModelAndView addingPage(){
        ModelAndView mv = new ModelAndView("add.jsp");
        return mv;
    }

    @RequestMapping("/add-del")
    public ModelAndView editPage(){
        ModelAndView mv = new ModelAndView("add-del.jsp");
       // mv.addObject("list", itemData.findAll());
        return mv;
    }
    @RequestMapping("/addItem")
    public ModelAndView addItem(Item item) {
        itemData.save(item);
        return indexPage();
    }

    @RequestMapping("/editItem")
    public ModelAndView editItem(Long id, String name, Double price) {
        Item item =  itemData.findById(id).orElse(new Item());
        item.setName(name);
        item.setPrice(price);
        itemData.save(item);
        return indexPage();
    }

    @RequestMapping(value="/deleteItem", method={RequestMethod.DELETE, RequestMethod.GET})
    public ModelAndView deleteItem(Long id) {
        itemData.deleteById(id);
        return indexPage();
    }

    @RequestMapping("/getItem")
    public ModelAndView getItem(Long id) {
        Item item =  itemData.findById(id).orElse(new Item());
        ModelAndView mv = new ModelAndView("newItem.jsp");
        mv.addObject("item", item);
        return mv;
    }
}
