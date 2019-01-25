package ${package}.service;

import ${package}.model.${model};
import java.util.List;

/**
* Created by kk on ${now?date}.
*/
public interface ${model}Service {

    int insert(${model} ${model?uncap_first});

    int delete(${model} ${model?uncap_first});

    int deleteByIds(Integer[] ids);

    int update(${model} ${model?uncap_first});

    ${model} getById(Integer id);

    List<${model}> list(${model} ${model?uncap_first});
}