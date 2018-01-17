package cn.com.fdc.app.controller;

import cn.com.fdc.app.domain.Student;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import javax.validation.Valid;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.stream.Collectors;


/**
 * Created by lixp on 2017/12/14.
 */
@Controller
public class HellController {

    @RequestMapping("/student/hello")
    public @ResponseBody Student say(@Valid Student student,BindingResult result) {

        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();

        student.errorName = validator.validateProperty(student, "name")
                .iterator()
                .next()
                .getMessage();

        student.errorAge = validator.validateProperty(student, "age")
                .iterator()
                .next()
                .getMessage();
return student;
    }
}
