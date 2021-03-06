package tw.iiihealth;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class DefaultViewConfig implements WebMvcConfigurer{
	
	 @Override
	    public void addViewControllers(ViewControllerRegistry registry) {
	        registry.addViewController("/").setViewName("/index");
	        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
	    }
	
	

}
