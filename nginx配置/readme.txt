nginx版本
nginx-1.13.12

提供Windows下nginx的启动，重启，关闭功能.bat
为控制nginx脚本

修改nginx

注意 x-spring-boot-ui\swagger\index.html中
url = window.location.protocol+ "//" + window.location.host+"/v2/api-docs";
这块一定不要修改啊

注意 Swagger2.java这里面也要修改
在Swagger配置类创建API应用时，通过host()方法指定测试时的主机名，如果没有指定就是当前主机，可以指定端口

加入 .host("127.0.0.1")

public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())//调用apiInfo方法,创建一个ApiInfo实例,里面是展示在文档页面信息内容
                .host("127.0.0.1")
                .select()
                //控制暴露出去的路径下的实例
                //如果某个接口不想暴露,可以使用以下注解
                //这样,该接口就不会暴露在 swagger2 的页面下
                .apis(RequestHandlerSelectors.basePackage("com.suke.czx.modules.girls"))
                .paths(PathSelectors.any())
                .build();
    }
