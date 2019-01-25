package me.zingon;

import freemarker.template.TemplateException;
import me.zingon.backup.util.Maps;
import me.zingon.db.TableDao;
import me.zingon.service.*;
import me.zingon.service.impl.*;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.logging.Logger;

import static java.util.concurrent.TimeUnit.SECONDS;

/**
 * Hello world!
 */
public class App {
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");


    public static void main(String[] args) throws IOException, TemplateException, ParseException, InterruptedException {
        Logger logger= Logger.getLogger("");
        TableDao td=new TableDao();
        td.loadTables();
        logger.info("数据库加载完成");
        ModelService ms=new ModelServiceImpl();
        DaoService ds=new DaoServiceImpl();
        ServiceService ss=new ServiceServiceImpl();
        ControllerService cs=new ControllerServiceImpl();
        FrontService fs=new FrontServiceImpl();
        //根据数据库生成所有 model
        ms.createModels();
        //生成所有dao接口  接口包 增删该查
        ds.createDaos();
        //生成 sql xml文件
        ds.createMappers();
        //生成 service接口
        ss.createServices();
        //生成 service实现
        ss.createServiceImpls();
        //生成 Restful 接口
        cs.createControllers();
        //生成 前端js
        fs.createJss();
        //生成 前端 jsp
        fs.createJsps();
        /*List<String> tables = Maps.getTables();
        for (String table : tables) {
            ms.createModel(table);
            ds.createDao(table);
            ds.createMapper(table);
            ss.createService(table);
            ss.createServiceImpl(table);
            cs.createController(table);
        }*/
    }
}
