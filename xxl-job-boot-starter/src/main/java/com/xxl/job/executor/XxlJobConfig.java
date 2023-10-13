package com.xxl.job.executor;

import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties({XxlJobConfigProperties.class})
public class XxlJobConfig {

    @Bean
    @ConditionalOnMissingBean(XxlJobSpringExecutor.class)
    public XxlJobSpringExecutor xxlJobSpringExecutor(XxlJobConfigProperties configProperties) {

        // 创建 xxl-job executor 实例
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();

        // 执行器通讯TOKEN [选填]：非空时启用。
        xxlJobSpringExecutor.setAccessToken(configProperties.getAccessToken());

        // The Admin configs.
        if (null != configProperties.getAdmin()) {
            xxlJobSpringExecutor.setAdminAddresses(configProperties.getAdmin().getAddresses());
        }

        // The Executor configs.
        if (null != configProperties.getExecutor()) {
            xxlJobSpringExecutor.setAppname(configProperties.getExecutor().getAppname());
            xxlJobSpringExecutor.setAddress(configProperties.getExecutor().getAddress());
            xxlJobSpringExecutor.setIp(configProperties.getExecutor().getIp());
            xxlJobSpringExecutor.setPort(configProperties.getExecutor().getPort());
            xxlJobSpringExecutor.setLogPath(configProperties.getExecutor().getLogpath());
            xxlJobSpringExecutor.setLogRetentionDays(configProperties.getExecutor().getLogretentiondays());
        }

        return xxlJobSpringExecutor;
    }

}
