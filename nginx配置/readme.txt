nginx�汾
nginx-1.13.12

�ṩWindows��nginx���������������رչ���.bat
Ϊ����nginx�ű�

�޸�nginx

ע�� x-spring-boot-ui\swagger\index.html��
url = window.location.protocol+ "//" + window.location.host+"/v2/api-docs";
���һ����Ҫ�޸İ�

ע�� Swagger2.java������ҲҪ�޸�
��Swagger�����ഴ��APIӦ��ʱ��ͨ��host()����ָ������ʱ�������������û��ָ�����ǵ�ǰ����������ָ���˿�

���� .host("127.0.0.1")

public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())//����apiInfo����,����һ��ApiInfoʵ��,������չʾ���ĵ�ҳ����Ϣ����
                .host("127.0.0.1")
                .select()
                //���Ʊ�¶��ȥ��·���µ�ʵ��
                //���ĳ���ӿڲ��뱩¶,����ʹ������ע��
                //����,�ýӿھͲ��ᱩ¶�� swagger2 ��ҳ����
                .apis(RequestHandlerSelectors.basePackage("com.suke.czx.modules.girls"))
                .paths(PathSelectors.any())
                .build();
    }
