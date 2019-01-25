package ${package}.service.impl;

import ${package}.service.${model}Service;
import ${package}.dao.${model}Dao;
import ${package}.model.${model};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
* Created by kk on ${now?date}.
*/
@Service
public class ${model}ServiceImpl implements ${model}Service {

    @Autowired
    ${model}Dao ${model?uncap_first}Dao;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int insert(${model} ${model?uncap_first}){
        return ${model?uncap_first}Dao.insert(${model?uncap_first});
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int delete(${model} ${model?uncap_first}){
        return ${model?uncap_first}Dao.delete(${model?uncap_first});
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int deleteByIds(Integer[] ids) {
        return  ${model?uncap_first}Dao.deleteByIds(ids);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public int update(${model} ${model?uncap_first}){
        return ${model?uncap_first}Dao.update(${model?uncap_first});
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public ${model} getById(Integer id){
        return ${model?uncap_first}Dao.getById(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public List<${model}> list(${model} ${model?uncap_first}){
        return ${model?uncap_first}Dao.list(${model?uncap_first});
    }

}