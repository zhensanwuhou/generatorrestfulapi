package ${package}.dao;

import ${package}.model.${model};
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
* Created by kk on ${now?date}.
*/
public interface ${model}Dao {

    int insert(${model} ${model?uncap_first});

    int delete(${model} ${model?uncap_first});

    int deleteByIds(@Param("ids") Integer[] ids);

    int update(${model} ${model?uncap_first});

    ${model} getById(@Param("id") Integer id);

    List<${model}> list(${model} ${model?uncap_first});
}