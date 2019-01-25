<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >

<mapper namespace="${package}.dao.${model}Dao">
    <resultMap id="${model?uncap_first}" type="${package}.model.${model}">
    <#list fields as f>
        <#if f.key=='PRI'>
            <id property="${f.field}" column="${f.field_}"/>
        <#else>
            <result property="${f.field}" column="${f.field_}"/>
        </#if>
    </#list>
    </resultMap>

    <sql id="columns">
    <#list fields as f>
        <#if f_index==0>
            `${f.field_}` ,<#rt/>
        <#elseif f_has_next>
            <#t/>`${f.field_}` ,<#rt/>
        <#else >
            <#lt/>`${f.field_}`
        </#if>
    </#list>
    </sql>

    <insert id="insert">
        insert into `${table}`
        <trim prefix="(" suffix=")" suffixOverrides=",">
        <#list fields as f>
            <if test="${f.field} != null">
                `${f.field_}`,
            </if>
        </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
        <#list fields as f>
            <if test="${f.field} != null">
            ${r'#{'}${f.field}${r'}'} ,
            </if>
        </#list>
        </trim>
    </insert>

    <delete id="delete">
        delete from `${table}`
        <trim prefix="where " prefixOverrides="and ">
        <#list fields as f>
            <if test="${f.field} != null">
                and `${f.field_}` = ${r'#{'}${f.field}${r'}'}
            </if>
        </#list>
        </trim>
    </delete>

    <delete id="deleteByIds">
        delete from `${table}`
        where `id` in
        <foreach collection="ids" open="(" item="id" separator="," close=")">
        ${r'#{'}id${r'}'}
        </foreach>
    </delete>

    <update id="update">
        update `${table}`
        <set>
        <#list fields as f>
            <#if (f_index > 0)>
                <if test="${f.field} != null">
                    `${f.field_}` = ${r'#{'}${f.field}${r'}'},
                </if>
            </#if>
        </#list>
        </set>
        where id = ${r'#{id}'}
    </update>

    <select id="getById" resultMap="${model?uncap_first}">
        select
        <include refid="columns" />
        from `${table}`
        where `id` = ${r'#{id}'}
    </select>

    <select id="list" resultMap="${model?uncap_first}">
        select
        <include refid="columns" />
        from `${table}`
        <trim prefix="where " prefixOverrides="and ">
        <#list fields as f>
            <if test="${f.field} != null">
                and `${f.field_}` = ${r'#{'}${f.field}${r'}'}
            </if>
        </#list>
        </trim>
    </select>
</mapper>