package ${package}.controller;


import ${package}.service.${model}Service;
import ${package}.model.${model};
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
* Created by kk on ${now?date}.
*/
@Controller
@RequestMapping("/${model?lower_case}")
public class ${model}Controller{

    @Autowired
    ${model}Service ${model?uncap_first}Service;

    @RequestMapping(value="list")
    @ResponseBody
    public Object list${model}(){
        ${model} ${model?uncap_first}=new ${model}();
        return ${model?uncap_first}Service.list(${model?uncap_first});
    }

    @RequestMapping(value="getById")
    @ResponseBody
    public Object getById${model}(Integer id){
        return ${model?uncap_first}Service.getById(id);
    }

    @RequestMapping(value="insert")
    @ResponseBody
    public Object insert${model}(@RequestBody ${model} ${model?uncap_first}){
        return ${model?uncap_first}Service.insert(${model?uncap_first});
    }


    @RequestMapping(value="update")
    @ResponseBody
    public Object update${model}(@RequestBody ${model} ${model?uncap_first}){
        return ${model?uncap_first}Service.update(${model?uncap_first});
    }


    @RequestMapping(value="/delete")
    @ResponseBody
    public Object delete${model}(@RequestBody ${model} ${model?uncap_first}){
        return ${model?uncap_first}Service.delete(${model?uncap_first});
    }

    @RequestMapping(value="deleteByIds")
    @ResponseBody
    public Object delete${model}ByIds(@RequestBody Integer[] ids){
        return ${model?uncap_first}Service.deleteByIds(ids);
    }
}
