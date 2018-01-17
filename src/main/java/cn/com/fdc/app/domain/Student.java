package cn.com.fdc.app.domain;



import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by lixp on 2017/12/14.
 */

public class Student {

    public void setName(String name) {
        this.name = name;
    }

    @NotNull(message="内网账号不能为空") private String name;


    public String getName() {
        return name;
    }




    public void setAge(int age) {
        this.age = age;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    @Range(max = 200,message = "TOO OLD TO BE HUMAN")
    private int age;
public  String errorName;
    public  String errorAge;
    private int times;

    public int getAge() {
        return age;
    }

    public int getTimes() {
        return times;
    }
}
